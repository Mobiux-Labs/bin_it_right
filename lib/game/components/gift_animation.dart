import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:flame/events.dart';
import 'package:reseacue/game/gift_sequence.dart';
import 'package:reseacue/overlays/gift_collect_overlay.dart';
import 'package:reseacue/overlays/gift_open_overlay.dart';
import 'package:uuid/uuid.dart';

import 'package:reseacue/utils/utils.dart';

enum GiftAnimationState { idle, open }

class GiftAnimation extends SpriteAnimationComponent
    with TapCallbacks, HasGameRef<GiftSequence> {
  // ignore: unused_field
  final Logger _log = Logger(Constants.giftLoggerKey);

  String id = const Uuid().v4();

  late SpriteAnimationTicker _animationTicker;

  GiftAnimation({
    required super.position,
  }) : super(
          anchor: Anchor.center,
        );

  late final SpriteAnimation _openAnimation;
  late final SpriteAnimation _idleAnimation;

  @override
  FutureOr<void> onLoad() async {
    _idleAnimation = SpriteAnimation.spriteList(
      getIdleGiftAnimationSprites(),
      stepTime: Constants.giftAnimationStepTime,
      loop: true,
    );

    _openAnimation = SpriteAnimation.spriteList(
      getOpeningGiftAnimationSprites(),
      stepTime: Constants.giftAnimationStepTime,
      loop: false,
    );
    scale = Vector2.all(Constants.giftAnimationScale);
    animation = _idleAnimation;
    _animationTicker = animation?.createTicker() as SpriteAnimationTicker;
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    animation = _openAnimation;
    _animationTicker = animation?.createTicker() as SpriteAnimationTicker;
    _animationTicker.onComplete = () {
      game.overlays.remove(GiftOpenOverlay.id);
      game.overlays.add(GiftCollectOverlay.id);
    };
  }

  @override
  void update(double dt) {
    _animationTicker.update(dt);
    super.update(dt);
  }
}
