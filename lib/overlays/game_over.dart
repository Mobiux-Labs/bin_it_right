import 'package:flutter/material.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/app/ui/components/score_card.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/overlay_container.dart';

class GameOver extends StatelessWidget {
  static String id = 'GameOver';
  GameOver({super.key, required this.game});

  final Reseacue game;

  double containerWidth = 60;
  double containerHeight = 60;
  double shadowContainerHeight = 50;

  @override
  Widget build(BuildContext context) {
    return OverlayContainer(
      game: game,
      id: id,
      heading: 'BIN BOSS!',
      height: MediaQuery.of(context).size.height / 1.8,
      width: MediaQuery.of(context).size.width / 1.15,
      onClose: () {},
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 30.0,
        ),
        child: Column(
          children: [
            ScoreCard(
              imagePath: 'assets/images/earth_token.png',
              score: game.score.value.toString(),
              label: 'SCORE',
            ),
            const SizedBox(
              height: 30.0,
            ),
            ScoreCard(
              imagePath: 'assets/images/earth_token.png',
              score: '0',
              fontSize: 40,
              imageSize: 30,
              label: 'BEST',
              labelFontSize: 20,
              yOffset: 10,
              heightFactor: 11,
              padding: 10,
            ),
            const SizedBox(
              height: 60.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomAnimatedButton(
                  height: containerHeight,
                  width: containerWidth,
                  shadowHeight: shadowContainerHeight,
                  shadowWidth: containerWidth,
                  screenSize: MediaQuery.of(context).size,
                  onTap: () {},
                  imagePath: 'assets/images/home.png',
                  shadowContainerColor: Constants.redButtonShadowContainerColor,
                  containerColor: Constants.redButtonContainerColor,
                  shineColor: Constants.redButtonShineColor,
                  padding: const EdgeInsets.only(
                    left: 67.0,
                    top: 10.0,
                  ),
                ),
                CustomAnimatedButton(
                  height: containerHeight,
                  width: MediaQuery.of(context).size.width / 1.7,
                  shadowHeight: shadowContainerHeight,
                  shadowWidth: MediaQuery.of(context).size.width / 1.7,
                  screenSize: MediaQuery.of(context).size,
                  onTap: () {},
                  buttonText: 'CONTINUE',
                  shadowContainerColor:
                      Constants.greenButtonShadowContainerColor,
                  containerColor: Constants.greenButtonContainerColor,
                  shineColor: Constants.greenButtonShineColor,
                  padding: const EdgeInsets.only(
                    left: 67.0,
                    top: 10.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
