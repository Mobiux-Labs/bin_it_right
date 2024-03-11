// TODO: Extend to be multiple types
import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/utils/number.dart';

class Powerup extends SpriteComponent with HasGameRef<Reseacue>, TapCallbacks {
  Stopwatch elapsedTime = Stopwatch();

  @override
  FutureOr<void> onLoad() {
    elapsedTime.start();
    anchor = Anchor.center;
    sprite = Sprite(
      Flame.images.fromCache(AssetConstants.magnet),
    );

    position.x = getRandomDouble(width, game.size.x - width);
    position.y = getRandomDouble(0.0, game.size.y / 2);

    return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    game.powerUp();
    removeFromParent();
    super.onTapUp(event);
  }

  @override
  void update(double dt) {
    if (elapsedTime.elapsed.inSeconds >=
        Constants.powerUpAvailableTimeInSeconds) {
      removeFromParent();
    }
    super.update(dt);
  }
}
