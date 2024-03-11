import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/animation.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/components/token.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/utils/images.dart';
import 'package:reseacue/utils/utils.dart';
import 'package:vibration/vibration.dart';

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

  bool attracted = false;

  @override
  FutureOr<void> onLoad() async {
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
    FlameAudio.play('sfx/tap.mp3');
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

  void successfultDrop(WasteType type, Vector2 position) {
    for (int i = 0; i <= Constants.tokensPerWaste; i++) {
      game.world.add(
        Token(position: position - Vector2(30.0 * (i + 1), 30.0 * (i + 1))),
      );
    }
    FlameAudio.play(
        type == WasteType.wet ? 'sfx/wet_waste.mp3' : 'sfx/dry_waste.mp3');
    game.updateWasteCollectedSequence(type);
    game.updateScore();
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

  Future<void> vibrate() async {
    if (game.hasVibration != null || game.hasVibration == true) {
      Vibration.vibrate(pattern: [30, 100, 30, 100]);
    }
  }

  void wasteMissed() {
    FlameAudio.play('sfx/miss.mp3');
    vibrate();
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
        successfultDrop(WasteType.wet, position);
      } else {
        vibrate();
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
        successfultDrop(WasteType.dry, position);
      } else {
        vibrate();
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

    if (position.y >= game.size.y / 3 &&
        position.y <= game.size.y &&
        attracted == false &&
        game.powerUpMode == true) {
      attracted = true;
      final moveEffect = MoveEffect.to(
        Vector2(game.size.x / 2, game.size.y - 200),
        EffectController(
          duration: Constants.wasteRepositionAnimationSpeed,
          curve: Curves.easeIn,
        ),
      );

      final scaleEffect = ScaleEffect.to(
        Vector2.all(0.7),
        EffectController(
          duration: Constants.wasteRepositionAnimationSpeed,
          curve: Curves.easeIn,
        ),
      );

      final opacityEffect = OpacityEffect.to(
        0.3,
        EffectController(
          duration: Constants.wasteRepositionAnimationSpeed,
          curve: Curves.easeIn,
        ),
      );

      moveEffect.onComplete = () {
        game.updateScore();
        removeFromParent();
      };

      add(opacityEffect);
      add(scaleEffect);
      add(moveEffect);
    }

    spawnedPosition.y += Reseacue.gameSpeed;

    if ((position.y > game.size.y + Constants.outOfScreenDeltaToRemoveObject) ||
        (spawnedPosition.y >
            game.size.y + Constants.outOfScreenDeltaToRemoveObject)) {
      _log.info('Removing waste from parent');
      try {
        wasteMissed();
      } catch (e) {
        _log.warning(e);
      }
      removeFromParent();
    }

    _animationTicker.update(dt);
    super.update(dt);
  }
}
