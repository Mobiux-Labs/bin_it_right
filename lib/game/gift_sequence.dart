import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:reseacue/game/components/gift.dart';
import 'package:reseacue/game/components/gift_animation.dart';
import 'package:reseacue/game/components/token.dart';
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

  void tokensAnimation() {
    Vector2 position = Vector2(0, size.y / 2.5);
    for (int i = 0; i <= 20; i++) {
      world.add(
        Token(
          position: position -
              Vector2(
                30.0 * (i + 1),
                30.0 * (i + 1),
              ),
          moveToPosition: Vector2(-size.x / 2 + 25, -size.y / 2),
        ),
      );
    }
  }

  @override
  FutureOr<void> onLoad() async {
    currentType = gifts[0];

    GradientBackground gradientBackground =
        GradientBackground(position: Vector2(-size.x / 2, -size.y / 2));

    world.add(gradientBackground);

    giftAnimation =
        GiftAnimation(position: Vector2.all(0.0), type: currentType);

    world.add(giftAnimation);
    return super.onLoad();
  }
}

class GradientBackground extends PositionComponent
    with HasGameReference<GiftSequence> {
  GradientBackground({
    required super.position,
  }) : super(
          anchor: Anchor.topLeft,
        );

  @override
  void render(Canvas canvas) {
    Paint paint = Paint()
      ..shader = Gradient.linear(
        Offset(game.size.x / 2, 0),
        Offset(game.size.x / 2, game.size.y),
        [
          const Color(0xFF51B937),
          const Color(0xFFCBDE81),
        ],
      );
    canvas.drawRect(Rect.fromLTWH(0, 0, game.size.x, game.size.y), paint);
  }
}
