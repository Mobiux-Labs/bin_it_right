import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flutter/animation.dart';
import 'package:reseacue/game/game.dart';

enum WasteType {
  wet,
  dry,
}

class Waste extends SpriteComponent with HasGameRef<Reseacue>, DragCallbacks {
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
        type == WasteType.wet ? 'wet_waste.png' : 'dry_waste.png',
      ),
    );
    anchor = Anchor.center;
  }

  @override
  void onDragStart(DragStartEvent event) {
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
    tapped = false;
    add(
      MoveEffect.to(
        spawnedPosition,
        EffectController(
          duration: 0.1,
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

    if ((position.y > game.size.y + 100) ||
        (spawnedPosition.y > game.size.y + 100)) {
      removeFromParent();
    }

    super.update(dt);
  }
}
