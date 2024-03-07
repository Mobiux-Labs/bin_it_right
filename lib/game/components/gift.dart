import 'dart:async';

import 'package:flame/components.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:flame/events.dart';
import 'package:reseacue/utils/utils.dart';

enum GiftState { idle, open }

class Gift extends SpriteAnimationComponent with TapCallbacks {
  // ignore: unused_field
  final Logger _log = Logger(Constants.giftLoggerKey);

  Gift({
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
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    animation = _openAnimation;
  }
}