import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flutter/animation.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';

enum WasteType {
  wet,
  dry,
}

class Waste extends SpriteComponent with HasGameRef<Reseacue>, DragCallbacks {
  final Logger _log = Logger(Constants.wasteLoggerKey);

  WasteType? type;

  Waste({
    required super.position,
    super.scale,
  }) : type = Random().nextBool() ? WasteType.wet : WasteType.dry;

  bool tapped = false;
  late Vector2 spawnedPosition;

  @override
  FutureOr<void> onLoad() {
    spawnedPosition = position.clone();

    sprite = Sprite(
      Flame.images.fromCache(
        type == WasteType.wet
            ? AssetConstants.wetWaste
            : AssetConstants.dryWaste,
      ),
    );
    anchor = Anchor.center;
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

  @override
  void onDragEnd(DragEndEvent event) {
    _log.info('Drag ended');
    tapped = false;
    // TODO: Drop logic yet to be added
    add(
      MoveEffect.to(
        spawnedPosition,
        EffectController(
          duration: Constants.wasteRepositionAnimationSpeed,
          curve: Curves.easeIn,
        ),
      ),
    );
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

    super.update(dt);
  }
}
