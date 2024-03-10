import 'dart:async';

import 'package:flame/components.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/utils/images.dart';

enum VehicleState {
  idle,
  moving,
  wetWaste,
  dryWaste,
  bothWaste,
}

class Vehicle extends SpriteAnimationComponent with HasGameRef<Reseacue> {
  // ignore: unused_field
  final Logger _log = Logger(Constants.vehicleLoggerKey);

  Vehicle({
    required super.position,
  }) : super(
          anchor: Anchor.bottomCenter,
        );

  late final SpriteAnimation _wetWasteMovingAnimation;
  late final SpriteAnimation _dryWasteMovingAnimation;
  late final SpriteAnimation _bothWasteMovingAnimation;
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

    _wetWasteMovingAnimation = SpriteAnimation.spriteList(
      getWetWasteMovingVehicleAnimationSprites(),
      stepTime: Constants.movingVehicleAnimationStepTime,
      loop: true,
    );

    _dryWasteMovingAnimation = SpriteAnimation.spriteList(
      getDryWasteMovingVehicleAnimationSprites(),
      stepTime: Constants.movingVehicleAnimationStepTime,
      loop: true,
    );

    _bothWasteMovingAnimation = SpriteAnimation.spriteList(
      getBothWasteMovingVehicleAnimationSprites(),
      stepTime: Constants.movingVehicleAnimationStepTime,
      loop: true,
    );

    scale = Vector2.all(Constants.movingVehicleAnimationScale);
    animation = _idleAnimation;
  }

  void changeAnimationByState(VehicleState state) {
    switch (state) {
      case VehicleState.wetWaste:
        animation = _wetWasteMovingAnimation;
        break;
      case VehicleState.dryWaste:
        animation = _dryWasteMovingAnimation;
        break;
      case VehicleState.bothWaste:
        animation = _bothWasteMovingAnimation;
        break;
      case VehicleState.moving:
        animation = _movingAnimation;
        break;
      default:
        animation = _idleAnimation;
        break;
    }
  }
}
