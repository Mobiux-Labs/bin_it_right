import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:reseacue/assets.dart';

class Token extends SpriteComponent {
  Token({super.position});

  @override
  FutureOr<void> onLoad() {
    anchor = Anchor.center;
    sprite = Sprite(Flame.images.fromCache(AssetConstants.earthToken));

    add(
      MoveEffect.to(
        Vector2.all(0.0),
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

    if (position.x <= 10.0 && position.y <= 10.0) {
      removeFromParent();
    }
  }
}
