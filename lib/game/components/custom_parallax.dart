import 'dart:async';

import 'package:flame/components.dart';
import 'package:reseacue/game/game.dart';

class CustomParallax extends SpriteComponent with HasGameRef<Reseacue> {
  Vector2 gameSize;
  Vector2 initialPosition;
  World world;

  CustomParallax({
    required super.anchor,
    required super.sprite,
    required this.gameSize,
    required this.initialPosition,
    required this.world,
  });

  late SpriteComponent secondLayer;
  late SpriteComponent thirdLayer;

  @override
  FutureOr<void> onLoad() {
    secondLayer = SpriteComponent(
      sprite: sprite,
      anchor: anchor,
      position: Vector2(initialPosition.x, initialPosition.y - height),
    );
    world.add(secondLayer);
    thirdLayer = SpriteComponent(
      sprite: sprite,
      anchor: anchor,
      position: Vector2(initialPosition.x, initialPosition.y - (height * 2)),
    );
    world.add(thirdLayer);
    position = initialPosition;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.y += Reseacue.gameSpeed;
    secondLayer.position.y += Reseacue.gameSpeed;
    thirdLayer.position.y += Reseacue.gameSpeed;

    if (position.y >= (gameSize.y + height)) {
      position = Vector2(initialPosition.x, initialPosition.y - height);
    }

    if (secondLayer.position.y >= (gameSize.y + height)) {
      secondLayer.position =
          Vector2(initialPosition.x, initialPosition.y - height);
    }

    if (thirdLayer.position.y >= (gameSize.y + height)) {
      thirdLayer.position =
          Vector2(initialPosition.x, initialPosition.y - height);
    }

    super.update(dt);
  }
}
