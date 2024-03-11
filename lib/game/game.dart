import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/components/arc.dart';
import 'package:reseacue/game/components/building.dart';
import 'package:flutter/cupertino.dart';
import 'package:reseacue/game/components/custom_parallax.dart';
import 'package:reseacue/game/components/magnetic_field.dart';
import 'package:reseacue/game/components/powerup.dart';
import 'package:reseacue/game/components/vehicle.dart';
import 'package:reseacue/game/components/waste.dart';
import 'package:reseacue/utils/utils.dart';
import 'package:vibration/vibration.dart';

class Reseacue extends FlameGame {
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

  ArcComponent arc = ArcComponent(
    leftTop: Vector2.all(0.0),
    rightTop: Vector2.all(0.0),
    leftBottom: Vector2.all(0.0),
    rightBottom: Vector2.all(0.0),
    type: WasteType.wet,
  );

  late bool? hasVibration;

  final ValueNotifier<int> score = ValueNotifier<int>(0);

  bool powerUpMode = false;

  double previousGameSpeed = 0.0;

  late final magneticField;

  void powerUp() {
    powerUpMode = true;
    world.add(magneticField);
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

    interval.onTick = () {
      onUpdateOnTick();
    };

    powerUpInterval.onTick = () {
      onTickPowerUpTimer();
    };

    vehicle.changeAnimationByState(VehicleState.moving);
  }

  @override
  FutureOr<void> onLoad() async {
    leftSpawnPoint = Vector2(0.0, 0.0);
    rightSpawnPoint = Vector2(size.x, 0.0);

    _log.info('Loading assets');
    await Flame.images.loadAll(sprites);
    _log.info('Loaded all assets successfully');

    hasVibration = await Vibration.hasVibrator();

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
      );
      Waste rightWaste = Waste(
        position: rightSpawnPoint + Constants.rightWasteSpawnDelta,
        count: countToRender,
      );
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
    Powerup magnet = Powerup();

    _log.info('Adding magnet');
    world.add(magnet);
  }

  void onTickPowerUpTimer() {
    spawnPowerup();
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

  void changeVehicleAnimation(VehicleState state) {
    vehicle.changeAnimationByState(state);
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

    if (powerUpTime.elapsed.inSeconds >=
        Constants.powerUpAvailableTimeInSeconds) {
      powerDown();
    }

    interval.update(dt);
    powerUpInterval.update(dt);
    super.update(dt);
  }
}
