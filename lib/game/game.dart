import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';

import '../assets.dart' as ASSETS;

enum SkeletonState { idle, attack }

class Skeleton extends SpriteAnimationComponent
    with HasGameRef<Reseacue>, TapCallbacks {
  Skeleton({required super.position})
      : super(
            size: Vector2(43.0, 37.0),
            anchor: Anchor.center,
            scale: Vector2.all(7.0));

  late final SpriteAnimation _attackAnimation;
  late final SpriteAnimation _idleAnimation;
  SpriteAnimationTicker? _animationTicker = null;

  @override
  FutureOr<void> onLoad() async {
    _idleAnimation = SpriteAnimation.fromFrameData(
      Flame.images.fromCache(ASSETS.IDLE_SKELETON),
      SpriteAnimationData.sequenced(
        amount: 11,
        stepTime: 0.1,
        textureSize: Vector2(43.0, 37.0),
      ),
    );

    _attackAnimation = SpriteAnimation.fromFrameData(
      Flame.images.fromCache(ASSETS.ATTACK_SKELETON),
      SpriteAnimationData.sequenced(
        amount: 18,
        stepTime: 0.1,
        textureSize: Vector2(43.0, 37.0),
        texturePosition: Vector2(3.0, 0.0),
        loop: false,
      ),
    );

    animation = _idleAnimation;
    _animationTicker = animation?.createTicker();
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    animation = _attackAnimation;
    _animationTicker = animation?.createTicker();
  }

  @override
  void update(double dt) {
    _animationTicker?.update(dt);

    if (_animationTicker != null) {
      _animationTicker?.onComplete = () {
        animation = _idleAnimation;
      };
    }
    super.update(dt);
  }
}

class Reseacue extends FlameGame {
  // Enable this if hitbox boundary has to be seen
  @override
  bool debugMode = false;

  @override
  FutureOr<void> onLoad() async {
    await Flame.images.loadAll(ASSETS.SPRITES);

    camera.viewfinder.anchor = Anchor.topLeft;

    final skeleton = Skeleton(
      position: Vector2(size.x / 2, size.y / 2),
    );

    world.add(skeleton);
  }
}
