import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:reseacue/app/audio/sounds.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/utils/number.dart';
import 'package:uuid/uuid.dart';

enum GiftType { mobile, battery }

class Gift extends SpriteComponent with HasGameRef<Reseacue>, TapCallbacks {
  String id = const Uuid().v4();
  Stopwatch elapsedTime = Stopwatch();

  late GiftType type;

  @override
  FutureOr<void> onLoad() {
    elapsedTime.start();
    anchor = Anchor.center;
    sprite = Sprite(
      Flame.images.fromCache(AssetConstants.greenWins),
    );

    type = Random().nextBool() ? GiftType.battery : GiftType.mobile;

    scale = Vector2.all(0.4);

    position.x = getRandomDouble(width, game.size.x - width);
    position.y = getRandomDouble(height * 2, game.size.y / 2);

    return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    game.audioController.playSfx(SfxType.rareItem);
    game.removedGifts.add(id);
    game.updateGiftCollectedSequence(type);
    removeFromParent();
    super.onTapUp(event);
  }

  @override
  void update(double dt) {
    if (elapsedTime.elapsed.inSeconds >=
        Constants.powerUpAvailableTimeInSeconds) {
      game.removedGifts.add(id);
      removeFromParent();
    }
    super.update(dt);
  }
}
