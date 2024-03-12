import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/utils/images.dart';

class MagnetProgress extends SpriteAnimationComponent
    with HasGameRef<Reseacue> {
  MagnetProgress({required super.position});

  late SpriteAnimationTicker _animationTicker;

  @override
  FutureOr<void> onLoad() {
    anchor = Anchor.bottomCenter;

    animation = SpriteAnimation.spriteList(getMagnetProgressAnimationSprites(),
        stepTime: game.storageController.magnetPowerDuration.value / 10,
        loop: false);

    _animationTicker = animation?.createTicker() as SpriteAnimationTicker;

    _animationTicker.onComplete = () {
      removeFromParent();
    };
  }

  @override
  void update(double dt) {
    _animationTicker.update(dt);
    super.update(dt);
  }
}
