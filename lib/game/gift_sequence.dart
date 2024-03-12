import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/game/components/gift.dart';
import 'package:reseacue/game/components/gift_animation.dart';
import 'package:reseacue/utils/images.dart';

class GiftSequence extends FlameGame {
  List<GiftType> gifts;

  GiftSequence({required this.gifts});

  @override
  FutureOr<void> onLoad() async {
    await Flame.images.loadAll(getIdleGiftAnimationImages());
    await Flame.images.loadAll(getOpeningGiftAnimationImages());
    await Flame.images.load(AssetConstants.gradientBackground);

    SpriteComponent gradientBackground = SpriteComponent(
      sprite: Sprite(
        Flame.images.fromCache(AssetConstants.gradientBackground),
      ),
      anchor: Anchor.center,
    );

    world.add(gradientBackground);

    GiftAnimation giftAnimation = GiftAnimation(position: Vector2.all(0.0));

    world.add(giftAnimation);
    return super.onLoad();
  }
}
