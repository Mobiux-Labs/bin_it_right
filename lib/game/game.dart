import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/app/audio/audio_controller.dart';
import 'package:reseacue/app/settings/settings.dart';
import 'package:reseacue/app/storage/storage.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/components/arc.dart';
import 'package:reseacue/game/components/building.dart';
import 'package:flutter/cupertino.dart';
import 'package:reseacue/game/components/custom_parallax.dart';
import 'package:reseacue/game/components/gift.dart';
import 'package:reseacue/game/components/magnet_progress.dart';
import 'package:reseacue/game/components/magnetic_field.dart';
import 'package:reseacue/game/components/powerup.dart';
import 'package:reseacue/game/components/vehicle.dart';
import 'package:reseacue/game/components/waste.dart';
import 'package:reseacue/overlays/gift_opening_overlay.dart';
import 'package:reseacue/overlays/overlays.dart';
import 'package:reseacue/utils/utils.dart';

class Reseacue extends FlameGame {
  SettingsController settingsController;
  StorageController storageController;
  AudioController audioController;

  Reseacue({
    required this.settingsController,
    required this.storageController,
    required this.audioController,
  });

  final Logger _log = Logger(Constants.gameLoggerKey);

  static double gameSpeed = 0.0;

  Stopwatch elapsedTime = Stopwatch();
  Stopwatch powerUpTime = Stopwatch();

  Timer interval = Timer(
    getBuildingSpawnRate(gameSpeed),
    repeat: true,
  );

  Timer powerUpInterval = Timer(
    Constants.powerUpInterval,
    repeat: true,
  );

  Timer giftSpawnInterval = Timer(
    Constants.giftSpawnInterval,
    repeat: true,
  );

  // Enable this if hitbox boundary has to be seen
  @override
  // ignore: overridden_fields
  bool debugMode = false;

  @override
  Color backgroundColor() => Constants.backgroundColor;

  late Vector2 leftSpawnPoint;
  late Vector2 rightSpawnPoint;

  VehicleState vehicleState = VehicleState.idle;
  late Vehicle vehicle;

  List<WasteType> wasteCollectedOrder = [];
  List<GiftType> giftsCollectedOrder = [];

  List<String> removedBuildings = [];
  List<String> removedWastes = [];
  List<String> removedPowerups = [];
  List<String> removedGifts = [];

  List<Waste> wasteGenerated = [];
  List<Building> buildingsGenerated = [];
  List<Powerup> powerupsGenerated = [];
  List<Gift> giftsGenerated = [];

  ArcComponent arc = ArcComponent(
    leftTop: Vector2.all(0.0),
    rightTop: Vector2.all(0.0),
    leftBottom: Vector2.all(0.0),
    rightBottom: Vector2.all(0.0),
    type: WasteType.wet,
  );

  late bool? hasVibration;

  final ValueNotifier<int> lives = ValueNotifier<int>(3);
  final ValueNotifier<int> score = ValueNotifier<int>(0);

  bool powerUpMode = false;

  bool giftCollected = false;

  double previousGameSpeed = 0.0;

  late final MagneticField magneticField;

  void restart() {
    gameSpeed = 0.0;
    elapsedTime.stop();
    elapsedTime.reset();
    powerUpTime.stop();
    powerUpTime.reset();
    giftSpawnInterval.stop();
    giftSpawnInterval.reset();
    interval.stop();
    interval.reset();
    powerUpInterval.stop();
    powerUpInterval.reset();
    vehicle.changeAnimationByState(VehicleState.idle);
    wasteCollectedOrder = [];
    giftsCollectedOrder = [];
    lives.value = 3;
    powerUpMode = false;
    giftCollected = false;
    previousGameSpeed = 0.0;
    score.value = 0;

    for (Building building in buildingsGenerated) {
      if (removedBuildings.contains(building.id)) {
        continue;
      }
      world.remove(building);
    }

    for (Waste waste in wasteGenerated) {
      if (removedWastes.contains(waste.id)) {
        continue;
      }
      world.remove(waste);
    }

    for (Powerup powerup in powerupsGenerated) {
      if (removedPowerups.contains(powerup.id)) {
        continue;
      }
      world.remove(powerup);
    }

    for (Gift gift in giftsGenerated) {
      if (removedGifts.contains(gift.id)) {
        continue;
      }
      world.remove(gift);
    }

    try {
      world.remove(magneticField);
    } catch (e) {
      _log.warning('could not remove magnetic field');
    }

    removedBuildings = [];
    removedWastes = [];
    buildingsGenerated = [];
    wasteGenerated = [];
    powerupsGenerated = [];
    giftsGenerated = [];

    resumeEngine();
  }

  bool wereGiftsCollected() {
    return giftsCollectedOrder.isNotEmpty;
  }

  void reduceLife() {
    lives.value -= 1;

    if (lives.value <= 0) {
      pauseEngine();

      overlays.add(GameOverOverlay.id);

      if (wereGiftsCollected()) {
        overlays.add(GiftOpeningOverlay.id);
      }
    }
  }

  void powerUp() {
    powerUpMode = true;
    world.add(magneticField);
    world.add(MagnetProgress(position: vehicle.position));
    previousGameSpeed = gameSpeed;
    speedUpGameplay(Constants.powerUpGameSpeed);
    _log.info('Turning on power up');
    powerUpTime.start();
  }

  void powerDown() {
    speedUpGameplay(previousGameSpeed);
    _log.info('Turning off power up');
    powerUpMode = false;
    powerUpTime.stop();
    powerUpTime.reset();
    magneticField.removeFromParent();
  }

  void updateScore() {
    score.value += Constants.tokensPerWaste;
  }

  void start() {
    gameSpeed = Constants.initialGameSpeed;
    previousGameSpeed = gameSpeed;

    _log.info('Starting elapsed time stopwatch');
    elapsedTime.start();

    interval = Timer(
      getBuildingSpawnRate(gameSpeed),
      repeat: true,
    );

    powerUpInterval = Timer(
      Constants.powerUpInterval,
      repeat: true,
    );

    giftSpawnInterval = Timer(
      Constants.giftSpawnInterval,
      repeat: true,
    );

    interval.onTick = () {
      onUpdateOnTick();
    };

    powerUpInterval.onTick = () {
      onTickPowerUpTimer();
    };

    giftSpawnInterval.onTick = () {
      onTickGiftTimer();
    };

    vehicle.changeAnimationByState(VehicleState.moving);
  }

  @override
  FutureOr<void> onLoad() {
    leftSpawnPoint = Vector2(0.0, 0.0);
    rightSpawnPoint = Vector2(size.x, 0.0);

    _log.info('Setting camera viewfinder to top left');
    camera.viewfinder.anchor = Anchor.topLeft;

    _log.info('Loading road image');
    final roadImage = Flame.images.fromCache(AssetConstants.road);

    _log.info('Initializing road sprite');
    Sprite road = Sprite(roadImage);

    _log.info('Initializing road sprite component');
    SpriteComponent roadComponent = SpriteComponent(
      sprite: road,
      anchor: Anchor.topCenter,
      position: Vector2(size.x / 2, 0),
      //road is rendered to center of the screen
      size: Vector2(
        (size.x * Constants.roadRenderPercentage) / 100,
        size.y,
      ),
    );

    _log.info('Assing road sprite component to world');
    world.add(roadComponent);

    _log.info('Initializing road stripes parallax component');
    CustomParallax roadStripes = CustomParallax(
      anchor: Anchor.topCenter,
      sprite: Sprite(Flame.images.fromCache(AssetConstants.roadStripes)),
      initialPosition: Vector2(size.x / 2, 0.0),
      gameSize: size,
      world: world,
    );

    world.add(roadStripes);

    _log.info('Initializing left grass parallax component');
    CustomParallax leftGrass = CustomParallax(
      anchor: Anchor.topLeft,
      sprite: Sprite(Flame.images.fromCache(AssetConstants.leftGrass)),
      initialPosition: Vector2(0.0, 0.0),
      gameSize: size,
      world: world,
    );

    world.add(leftGrass);

    _log.info('Initializing right grass parallax component');
    CustomParallax rightGrass = CustomParallax(
      anchor: Anchor.topRight,
      sprite: Sprite(Flame.images.fromCache(AssetConstants.rightGrass)),
      initialPosition: Vector2(size.x, 0.0),
      gameSize: size,
      world: world,
    );

    world.add(rightGrass);

    magneticField = MagneticField(
      position: Vector2(size.x / 2, size.y * 0.7),
    );

    _log.info('Initializing vehicle');
    vehicle = Vehicle(
      position: Vector2(
        size.x / 2,
        size.y - (size.y / Constants.vehicleSpawnDeltaFromBottom),
      ),
    );
    _log.info('Adding vehicle to world');
    world.add(vehicle);

    spawnBuildings();
    spawnWastes();
  }

  void drawPath(Vector2 leftTop, Vector2 rightTop, Vector2 leftBottom,
      Vector2 rightBottom, WasteType type) {
    arc = ArcComponent(
      leftTop: leftTop,
      rightTop: rightTop,
      leftBottom: leftBottom,
      rightBottom: rightBottom,
      type: type,
    );

    world.add(arc);
  }

  void removeArc() {
    arc.removeFromParent();
  }

  void spawnBuildings() {
    Building buildingLeft = Building(
      position: leftSpawnPoint,
      scale: Vector2.all(Constants.buildingScale),
    );

    Building buildingRight = Building(
      position: rightSpawnPoint,
      scale: Vector2.all(Constants.buildingScale),
      anchor: Anchor.topRight,
    );

    buildingsGenerated.add(buildingRight);
    buildingsGenerated.add(buildingLeft);

    _log.info('Adding left building to world');
    world.add(buildingLeft);
    _log.info('Adding right building to world');
    world.add(buildingRight);
  }

  void spawnWastes() {
    int count = getRandomIntegrerInRange(1, getMaxCountByGameSpeed(gameSpeed));

    for (int countToRender = 1; countToRender <= count; countToRender++) {
      Waste leftWaste = Waste(
        position: leftSpawnPoint + Constants.leftWasteSpawnDelta,
        count: countToRender,
        settingsController: settingsController,
        audioController: audioController,
      );
      Waste rightWaste = Waste(
        position: rightSpawnPoint + Constants.rightWasteSpawnDelta,
        count: countToRender,
        settingsController: settingsController,
        audioController: audioController,
      );

      wasteGenerated.add(leftWaste);
      wasteGenerated.add(rightWaste);

      _log.info('Adding left waste to world');
      world.add(leftWaste);
      _log.info('Adding right waste to world');
      world.add(rightWaste);
    }
  }

  void onUpdateOnTick() {
    leftSpawnPoint = Vector2(
      0.0,
      getRandomDouble(
        Constants.minimumBuildingSpawnArea,
        Constants.maximumBuildingSpawnArea,
      ),
    );
    rightSpawnPoint = Vector2(
      size.x,
      getRandomDouble(
        Constants.minimumBuildingSpawnArea,
        Constants.maximumBuildingSpawnArea,
      ),
    );

    spawnBuildings();

    spawnWastes();
  }

  void spawnPowerup() {
    Powerup magnet = Powerup(audioController: audioController);

    powerupsGenerated.add(magnet);

    _log.info('Adding magnet');
    world.add(magnet);
  }

  void onTickPowerUpTimer() {
    spawnPowerup();
  }

  void spawnGift() {
    if (giftCollected == true) {
      return;
    }

    Gift gift = Gift();

    giftsGenerated.add(gift);

    _log.info('Adding gift');
    world.add(gift);

    giftCollected = true;
  }

  void onTickGiftTimer() {
    spawnGift();
  }

  void updateWasteCollectedSequence(WasteType type) {
    if (wasteCollectedOrder.isEmpty) {
      wasteCollectedOrder.add(type);
      changeVehicleAnimation(type == WasteType.wet
          ? VehicleState.wetWaste
          : VehicleState.dryWaste);
      return;
    } else if (wasteCollectedOrder.length == 1 &&
        !wasteCollectedOrder.contains(type)) {
      wasteCollectedOrder.add(type);
      changeVehicleAnimation(VehicleState.bothWaste);
      return;
    } else {
      return;
    }
  }

  void updateGiftCollectedSequence(GiftType type) {
    if (type == GiftType.mobile) {
      storageController.unlockPhone();
    }
    if (type == GiftType.battery) {
      storageController.unlockBattery();
    }
    giftsCollectedOrder.add(type);
  }

  void changeVehicleAnimation(VehicleState state) {
    vehicle.changeAnimationByState(state);
  }

  void updateVehicle() {
    world.remove(vehicle);

    vehicle = Vehicle(
      position: Vector2(
        size.x / 2,
        size.y - (size.y / Constants.vehicleSpawnDeltaFromBottom),
      ),
    );
    _log.info('Adding vehicle to world');
    world.add(vehicle);
  }

  void speedUpGameplay(updateGameSpeed) {
    gameSpeed = updateGameSpeed;
    _log.info('Stopping interval timer');
    interval.stop();
    _log.info('Stopped interval timer successfully');
    _log.info('Resetting interval timer');
    interval = Timer(
      getBuildingSpawnRate(updateGameSpeed),
      repeat: true,
    );
    interval.onTick = () {
      onUpdateOnTick();
    };
    interval.resume();
    _log.info('Reset interval timer successfully');
  }

  @override
  void update(double dt) {
    if (!powerUpMode) {
      if (elapsedTime.elapsed.inSeconds == Constants.gameSpeedUpTimeLevel1) {
        _log.info('Increasing game speed to ${Constants.gameSpeedLevel1}');
        speedUpGameplay(Constants.gameSpeedLevel1);
      }
      if (elapsedTime.elapsed.inSeconds == Constants.gameSpeedUpTimeLevel2) {
        _log.info('Increasing game speed to ${Constants.gameSpeedLevel2}');
        speedUpGameplay(Constants.gameSpeedLevel2);
      }
      if (elapsedTime.elapsed.inSeconds == Constants.gameSpeedUpTimeLevel3) {
        _log.info('Increasing game speed to ${Constants.gameSpeedLevel3}');
        speedUpGameplay(Constants.gameSpeedLevel3);
      }
      if (elapsedTime.elapsed.inSeconds == Constants.gameSpeedUpTimeLevel4) {
        _log.info('Increasing game speed to ${Constants.gameSpeedLevel4}');
        speedUpGameplay(Constants.gameSpeedLevel4);
      }
    }

    if (powerUpTime.elapsed.inSeconds >=
        storageController.magnetPowerDuration.value) {
      powerDown();
    }

    interval.update(dt);
    powerUpInterval.update(dt);
    giftSpawnInterval.update(dt);
    super.update(dt);
  }
}
