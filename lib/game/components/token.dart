import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:reseacue/assets.dart';

class Token extends SpriteComponent {
  Token({super.position, this.moveToPosition});

  Vector2? moveToPosition;

  @override
  FutureOr<void> onLoad() {
    anchor = Anchor.center;
    sprite = Sprite(Flame.images.fromCache(AssetConstants.earthToken));

    add(
      MoveEffect.to(
        moveToPosition ?? Vector2.all(0.0),
        EffectController(
          duration: 0.3,
          curve: Curves.easeIn,
        ),
      ),
    );

    add(
      OpacityEffect.to(
        0.0,
        EffectController(
          duration: 0.3,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    Vector2 endPosition = Vector2(10.0, 10.0);
    if (moveToPosition != null) {
      endPosition.x = moveToPosition!.x + 10.0;
      endPosition.y = moveToPosition!.y + 10.0;
    }

    if (position.x <= endPosition.x && position.y <= endPosition.y) {
      removeFromParent();
    }
  }
}
