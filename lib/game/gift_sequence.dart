import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/game/components/gift.dart';
import 'package:reseacue/game/components/gift_animation.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/utils/number.dart';

class GiftSequence extends FlameGame {
  List<GiftType> gifts;
  final Reseacue mainGame;

  late GiftType currentType;

  GiftSequence({
    required this.gifts,
    required this.mainGame,
  });

  late GiftAnimation giftAnimation;

  void updateScoreOnRecycle() {
    mainGame.storageController
        .updateScoreForGreenWins(getTokensByGiftType(currentType));
  }

  @override
  FutureOr<void> onLoad() async {
    currentType = gifts[0];

    SpriteComponent gradientBackground = SpriteComponent(
      sprite: Sprite(
        Flame.images.fromCache(AssetConstants.gradientBackground),
      ),
      anchor: Anchor.center,
    );

    world.add(gradientBackground);

    giftAnimation =
        GiftAnimation(position: Vector2.all(0.0), type: currentType);

    world.add(giftAnimation);
    return super.onLoad();
  }
}
