import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/components/building.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/cupertino.dart';
import 'package:reseacue/utils/utils.dart';

class Reseacue extends FlameGame {
  final Logger _log = Logger('Game');

  static double gameSpeed = 1.0;

  Stopwatch elapsedTime = Stopwatch();
  Timer interval = Timer(
    getBuildingSpawnRate(gameSpeed),
    repeat: true,
  );

  late ParallaxComponent roadStripes;
  late ParallaxComponent leftGrassComponent;
  late ParallaxComponent rightGrassComponent;

  // Enable this if hitbox boundary has to be seen
  @override
  // ignore: overridden_fields
  bool debugMode = false;

  @override
  Color backgroundColor() => const Color(0xFFE7DFC1);

  Vector2 baseVelocity = Vector2(
    0,
    getVelocity(gameSpeed),
  );

  late Vector2 leftSpawnPoint;
  late Vector2 rightSpawnPoint;

  @override
  FutureOr<void> onLoad() async {
    await Flame.images.loadAll(sprites);
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

    elapsedTime.start();
    camera.viewfinder.anchor = Anchor.topLeft;

    final roadImage = Flame.images.fromCache('road.png');

    Sprite road = Sprite(roadImage);
    SpriteComponent roadComponent = SpriteComponent(
      sprite: road,
      anchor: Anchor.topCenter,
      position: Vector2(size.x / 2, 0),
      //road is rendered to center of the screen
      size: Vector2(
        (size.x * 41) / 100, //41% of screen is covered with road
        size.y,
      ),
    );

    world.add(roadComponent);

    roadStripes = await loadParallaxComponent(
      [
        ParallaxImageData(
          'road_stripes.png',
        ),
      ],
      position: Vector2(size.x / 2, 0),
      //Set velocity
      baseVelocity: baseVelocity,
      repeat: ImageRepeat.repeatY,
    );
    world.add(roadStripes);

    leftGrassComponent = await loadParallaxComponent(
      [
        ParallaxImageData(
          'grass_left_side.png',
        ),
      ],
      //Set velocity
      baseVelocity: baseVelocity,
      repeat: ImageRepeat.repeatY,
    );
    world.add(leftGrassComponent);

    rightGrassComponent = await loadParallaxComponent(
      [
        ParallaxImageData(
          'grass_right_side.png',
        ),
      ],
      position: Vector2(0, 0),
      alignment: Alignment.topRight,
      //Set velocity
      baseVelocity: baseVelocity,
      repeat: ImageRepeat.repeatY,
    );
    world.add(rightGrassComponent);

    interval.onTick = () {
      Building buildingLeft = Building(
        position: leftSpawnPoint,
        scale: Vector2.all(0.3),
      );

      world.add(buildingLeft);

      Building buildingRight = Building(
        position: rightSpawnPoint,
        scale: Vector2.all(0.3),
        anchor: Anchor.topRight,
      );

      world.add(buildingRight);
    };
  }

  void speedUpGameplay(updateGameSpeed) {
    gameSpeed = updateGameSpeed;
    baseVelocity = Vector2(
      0,
      getVelocity(updateGameSpeed),
    );
    roadStripes.parallax?.baseVelocity = baseVelocity;
    leftGrassComponent.parallax?.baseVelocity = baseVelocity;
    rightGrassComponent.parallax?.baseVelocity = baseVelocity;
    interval.stop();
    interval = Timer(
      getBuildingSpawnRate(updateGameSpeed),
      repeat: true,
    );
    interval.onTick = () {
      Building buildingLeft = Building(
        position: leftSpawnPoint,
        scale: Vector2.all(0.3),
      );

      world.add(buildingLeft);

      Building buildingRight = Building(
        position: rightSpawnPoint,
        scale: Vector2.all(0.3),
        anchor: Anchor.topRight,
      );

      world.add(buildingRight);
    };
    interval.resume();
  }

  @override
  void update(double dt) {
    if (elapsedTime.elapsed.inSeconds == 10) {
      speedUpGameplay(1.5);
    }
    if (elapsedTime.elapsed.inSeconds == 20) {
      speedUpGameplay(2.0);
    }
    if (elapsedTime.elapsed.inSeconds == 30) {
      speedUpGameplay(2.5);
    }
    if (elapsedTime.elapsed.inSeconds == 40) {
      speedUpGameplay(3.0);
    }
    interval.update(dt);
    super.update(dt);
  }
}
