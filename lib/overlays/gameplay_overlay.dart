import 'package:flutter/material.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/app/ui/components/earth_tokens.dart';
import 'package:reseacue/app/ui/components/lives_container.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/overlays.dart';

class GamePlayOverlay extends StatelessWidget {
  static const String id = 'gameplay_overlay';
  final Reseacue game;

  const GamePlayOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        right: 15.0,
        top: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder(
              valueListenable: game.score,
              builder: (context, int value, child) {
                return EarthTokens(
                  earthPoints: value,
                  containerHeight: 50,
                  containerWidth: screenWidth * 0.2,
                  shadowContainerHeight: 40,
                  shadowContainerWidth: screenWidth * 0.2,
                );
              }),
          ValueListenableBuilder(
              valueListenable: game.lives,
              builder: (context, int value, child) {
                return LivesContainer(lives: value);
              }),
          CustomAnimatedButton(
            height: 50,
            width: 50,
            shadowHeight: 40,
            shadowWidth: 50,
            screenSize: MediaQuery.of(context).size,
            onTap: () {
              game.pauseEngine();
              game.overlays.add(PauseOverlay.id);
              game.overlays.remove(GamePlayOverlay.id);
            },
            imagePath: 'assets/images/pause.png',
            shadowContainerColor: Constants.yellowButtonShadowContainerColor,
            containerColor: Constants.yellowButtonContainerColor,
            shineColor: Constants.yellowButtonShineColor,
            padding: const EdgeInsets.only(
              left: 50,
              top: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
