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

  late SpriteAnimationTicker _animationTicker;

  @override
  FutureOr<void> onLoad() {
    spawnedPosition = position.clone();

    animation = SpriteAnimation.spriteList(
      getIdleWasteAnimationSpritesByTypeAndCount(type as WasteType, count),
      stepTime: Constants.idleWasteAnimationStepTime,
      loop: true,
    );

    _animationTicker = animation?.createTicker() as SpriteAnimationTicker;

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
    try {
      if ((position.y >
              game.size.y + (Constants.outOfScreenDeltaToRemoveObject / 2)) ||
          (spawnedPosition.y >
              game.size.y + (Constants.outOfScreenDeltaToRemoveObject / 2))) {
        _log.info('Removing waste from parent');
      }

      position = position + event.localDelta;
      game.removeArc();
      game.drawPath(
        Vector2(position.x - size.x / 4, position.y),
        Vector2(position.x + size.x / 4, position.y),
        Vector2(game.vehicle.x - game.vehicle.width / 3,
            type == WasteType.wet ? wetWasteTopBound : dryWasteTopBound),
        Vector2(game.vehicle.x + game.vehicle.width / 3,
            type == WasteType.wet ? wetWasteTopBound : dryWasteTopBound),
        type as WasteType,
      );
      super.onDragUpdate(event);
    } catch (e) {
      game.removeArc();
      _log.info('Waste already removed');
    }
  }

  @override
  void onDragCancel(DragCancelEvent event) {
    game.removeArc();
    super.onDragCancel(event);
  }

  void successfultDrop(WasteType type) {
    game.updateWasteCollectedSequence(type);
    scale = Vector2.all(Constants.dropWasteAnimationScale);
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

    game.removeArc();

    if (type == WasteType.wet) {
      if ((position.x - width) <
              wetWasteRightBound && // This is because the anchor point of waste is `Anchor.center`, so the delta `width` corrects that
          position.y > wetWasteTopBound &&
          position.x > wetWasteLeftBound &&
          position.y < wetWasteBottomBound) {
        successfultDrop(WasteType.wet);
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
        successfultDrop(WasteType.dry);
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
