import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/app/ui/components/earth_tokens.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/components/token.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/game/gift_sequence.dart';
import 'package:reseacue/overlays/gift_opening_overlay.dart';
import 'package:reseacue/overlays/settings_overlay.dart';
import 'package:reseacue/utils/number.dart';

class GiftCollectOverlay extends StatelessWidget {
  const GiftCollectOverlay({
    super.key,
    required this.mainGame,
    required this.game,
  });

  final Reseacue mainGame;
  final GiftSequence game;

  static const String id = 'gift_collect_overlay';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                  valueListenable: mainGame.storageController.score,
                  builder: (context, score, child) {
                    return EarthTokens(
                      earthPoints: score,
                    );
                  },
                ),
                CustomAnimatedButton(
                  height: 50,
                  width: 50,
                  shadowHeight: 40,
                  shadowWidth: 50,
                  screenSize: MediaQuery.of(context).size,
                  onTap: () {
                    game.overlays.add(SettingsOverlay.id);
                  },
                  imagePath: 'assets/images/settings.png',
                  shadowContainerColor:
                      Constants.yellowButtonShadowContainerColor,
                  containerColor: Constants.yellowButtonContainerColor,
                  shineColor: Constants.yellowButtonShineColor,
                  padding: const EdgeInsets.only(
                    left: 50,
                    top: 10.0,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                CustomAnimatedButton(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.7,
                  shadowHeight: 50,
                  shadowWidth: MediaQuery.of(context).size.width / 1.7,
                  screenSize: MediaQuery.of(context).size,
                  onTap: () {
                    game.tokensAnimation();
                    game.updateScoreOnRecycle();
                    game.overlays.remove(id);
                    mainGame.overlays.remove(GiftOpeningOverlay.id);
                  },
                  buttonText: 'RECYCLE',
                  shadowContainerColor: Constants.redButtonShadowContainerColor,
                  containerColor: Constants.redButtonContainerColor,
                  shineColor: Constants.redButtonShineColor,
                  padding: const EdgeInsets.only(
                    left: 67.0,
                    top: 10.0,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
