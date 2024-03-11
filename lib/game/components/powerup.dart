import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:reseacue/app/audio/audio_controller.dart';
import 'package:reseacue/app/audio/sounds.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/utils/number.dart';
import 'package:uuid/uuid.dart';

class Powerup extends SpriteComponent with HasGameRef<Reseacue>, TapCallbacks {
  String id = const Uuid().v4();
  Stopwatch elapsedTime = Stopwatch();

  final AudioController audioController;

  Powerup({
    required this.audioController,
  });

  @override
  FutureOr<void> onLoad() {
    elapsedTime.start();
    anchor = Anchor.center;
    sprite = Sprite(
      Flame.images.fromCache(AssetConstants.magnet),
    );

    position.x = getRandomDouble(width, game.size.x - width);
    position.y = getRandomDouble(height * 2, game.size.y / 2);

    return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    audioController.playSfx(SfxType.rareItem);
    game.powerUp();
    game.removedPowerups.add(id);
    removeFromParent();
    super.onTapUp(event);
  }

  @override
  void update(double dt) {
    if (elapsedTime.elapsed.inSeconds >=
        Constants.powerUpAvailableTimeInSeconds) {
      game.removedPowerups.add(id);
      removeFromParent();
    }
    super.update(dt);
  }
}
