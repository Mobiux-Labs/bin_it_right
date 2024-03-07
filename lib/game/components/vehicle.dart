import 'dart:async';

import 'package:flame/components.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/utils/images.dart';

class Vehicle extends SpriteAnimationComponent with HasGameRef<Reseacue> {
  // ignore: unused_field
  final Logger _log = Logger(Constants.vehicleLoggerKey);

  Vehicle({
    required super.position,
  }) : super(
          anchor: Anchor.bottomCenter,
        );

  late final SpriteAnimation _movingAnimation;
  late final SpriteAnimation _idleAnimation;

  @override
  FutureOr<void> onLoad() async {
    _idleAnimation = SpriteAnimation.spriteList(
      getIdleVehicleAnimationSprites(),
      stepTime: Constants.idleVehicleAnimationStepTime,
      loop: true,
    );

    _movingAnimation = SpriteAnimation.spriteList(
      getMovingVehicleAnimationSprites(),
      stepTime: Constants.movingVehicleAnimationStepTime,
      loop: true,
    );
    scale = Vector2.all(Constants.movingVehicleAnimationScale);
    animation = _movingAnimation;
  }
}
