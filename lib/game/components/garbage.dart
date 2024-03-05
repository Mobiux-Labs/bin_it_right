import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flutter/animation.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';

enum GarbageGenericType {
  wet,
  dry,
}

enum GarbageType {
  organic,
  inorganic,
  paper,
  electronic,
  hazardous,
  textile,
  construction,
  medical,
  liquid,
}

class Garbage extends SpriteComponent with HasGameRef<Reseacue>, DragCallbacks {
  final GarbageGenericType garbageGenericType;
  final GarbageType garbageType;
  final String assetSrc;

  Garbage({
    required this.garbageGenericType,
    required this.garbageType,
    required super.position,
    required this.assetSrc,
    required super.size,
    required super.anchor,
  });

  Logger _log = Logger(Constants.mainLoggerKey);
  bool tapped = false;
  Vector2 previousPosition = Vector2(0.0, 0.0);

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(
      Flame.images.fromCache(assetSrc),
    );
  }

  @override
  void onDragStart(DragStartEvent event) {
    _log.info('Garbage tapped');
    tapped = true;
    previousPosition = position.clone();
    super.onDragStart(event);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position = position + event.localDelta;
    super.onDragUpdate(event);
  }

  @override
  void onDragEnd(DragEndEvent event) {
    _log.info('Garbage released');
    tapped = false;
    add(
      MoveEffect.to(
        previousPosition,
        EffectController(
          duration: 0.1,
          curve: Curves.easeIn,
        ),
      ),
    );
    // position = previousPosition;
    super.onDragEnd(event);
  }

  @override
  void update(double dt) {
    if (tapped == false) {
      position.y = position.y += Reseacue.gameSpeed;
    }

    if (position.y > 800) {
      position = Vector2.all(10.0);
    }

    super.update(dt);
  }
}
