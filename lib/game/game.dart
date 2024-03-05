import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/game/components/building.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/cupertino.dart';
import 'package:reseacue/utils/utils.dart';

class Reseacue extends FlameGame {
  final Logger _log = Logger('Game');

  static const double gameSpeed = 0.85;

  Stopwatch elapsedTime = Stopwatch();
  Timer interval = Timer(1.7, repeat: true);

  // Enable this if hitbox boundary has to be seen
  @override
  // ignore: overridden_fields
  bool debugMode = false;

  @override
  Color backgroundColor() => const Color(0xFFE7DFC1);

  final Vector2 baseVelocity = Vector2(
    0,
    -100,
  );

  @override
  FutureOr<void> onLoad() async {
    await Flame.images.loadAll(sprites);
    Vector2 leftSpawnPoint = Vector2(0.0, getRandomDouble(-400, -200));
    Vector2 rightSpawnPoint = Vector2(size.x, getRandomDouble(-400, -200));

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

    ParallaxComponent roadStripes = await loadParallaxComponent(
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

    ParallaxComponent leftGrassComponent = await loadParallaxComponent(
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

    ParallaxComponent rightGrassComponent = await loadParallaxComponent(
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

  @override
  void update(double dt) {
    interval.update(dt);

    super.update(dt);
  }
}
