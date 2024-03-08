import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/animation.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/utils/images.dart';
import 'package:reseacue/utils/utils.dart';

enum WasteType {
  wet,
  dry,
}

class Waste extends SpriteAnimationComponent
    with HasGameRef<Reseacue>, DragCallbacks {
  final Logger _log = Logger(Constants.wasteLoggerKey);

  WasteType? type;
  int count;

  Waste({
    required super.position,
    super.scale,
    required this.count,
  }) : type = Random().nextBool() ? WasteType.wet : WasteType.dry;

  bool tapped = false;
  late Vector2 spawnedPosition;

  late double wetWasteLeftBound;
  late double wetWasteTopBound;
  late double wetWasteRightBound;
  late double wetWasteBottomBound;

  late double dryWasteLeftBound;
  late double dryWasteTopBound;
  late double dryWasteRightBound;
  late double dryWasteBottomBound;

  late final SpriteAnimationTicker _animationTicker;

  @override
  FutureOr<void> onLoad() {
    spawnedPosition = position.clone();

    animation = SpriteAnimation.spriteList(
      getIdleWasteAnimationSpritesByTypeAndCount(type as WasteType, count),
      stepTime: Constants.idleWasteAnimationStepTime,
      loop: true,
    );

    anchor = Anchor.center;

    wetWasteLeftBound = game.vehicle.width -
        (game.vehicle.width * 0.15) -
        (game.vehicle.width * 0.41 / 2);
    wetWasteBottomBound = game.vehicle.y - (game.vehicle.height * 0.38);
    wetWasteRightBound = game.vehicle.x -
        (game.vehicle.width / 2) +
        (game.vehicle.width * 0.41 / 2);
    wetWasteTopBound =
        game.vehicle.y - game.vehicle.height + (game.vehicle.height * 0.36);

    dryWasteLeftBound = game.vehicle.width -
        (game.vehicle.width * 0.15) -
        (game.vehicle.width * 0.41 / 2);
    dryWasteBottomBound = game.vehicle.y - (game.vehicle.height * 0.09);
    dryWasteRightBound = game.vehicle.x -
        (game.vehicle.width / 2) +
        (game.vehicle.width * 0.41 / 2);
    dryWasteTopBound =
        game.vehicle.y - game.vehicle.height + (game.vehicle.height * 0.66);
  }

  @override
  void onDragStart(DragStartEvent event) {
    _log.info('Drag started at ${event.localPosition}');
    tapped = true;
    super.onDragStart(event);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position = position + event.localDelta;
    super.onDragUpdate(event);
  }

  void successfultDrop() {
    animation = SpriteAnimation.spriteList(
      getWasteDropAnimationSprites(),
      stepTime: Constants.dropWasteAnimationStepTime,
      loop: false,
    );
    _animationTicker = animation?.createTicker() as SpriteAnimationTicker;
    _animationTicker.onComplete = () {
      removeFromParent();
    };
  }

  @override
  void onDragEnd(DragEndEvent event) {
    _log.info('Drag ended');
    tapped = false;

    if (type == WasteType.wet) {
      if ((position.x - width) <
              wetWasteRightBound && // This is because the anchor point of waste is `Anchor.center`, so the delta `width` corrects that
          position.y > wetWasteTopBound &&
          position.x > wetWasteLeftBound &&
          position.y < wetWasteBottomBound) {
        successfultDrop();
      } else {
        add(
          MoveEffect.to(
            spawnedPosition,
            EffectController(
              duration: Constants.wasteRepositionAnimationSpeed,
              curve: Curves.easeIn,
            ),
          ),
        );
      }
    } else {
      if ((position.x - width) <
              dryWasteRightBound && // This is because the anchor point of waste is `Anchor.center`, so the delta `width` corrects that
          position.y > dryWasteTopBound &&
          position.x > dryWasteLeftBound &&
          position.y < dryWasteBottomBound) {
        successfultDrop();
      } else {
        add(
          MoveEffect.to(
            spawnedPosition,
            EffectController(
              duration: Constants.wasteRepositionAnimationSpeed,
              curve: Curves.easeIn,
            ),
          ),
        );
      }
    }

    super.onDragEnd(event);
  }

  @override
  void update(double dt) {
    if (!tapped) {
      position.y += Reseacue.gameSpeed;
    }

    spawnedPosition.y += Reseacue.gameSpeed;

    if ((position.y > game.size.y + Constants.outOfScreenDeltaToRemoveObject) ||
        (spawnedPosition.y >
            game.size.y + Constants.outOfScreenDeltaToRemoveObject)) {
      _log.info('Removing waste from parent');
      removeFromParent();
    }

    _animationTicker.update(dt);
    super.update(dt);
  }
}
