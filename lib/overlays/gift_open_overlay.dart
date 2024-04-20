import 'package:flutter/material.dart';
import 'package:reseacue/app/audio/sounds.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/app/ui/components/earth_tokens.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/game/gift_sequence.dart';
import 'package:reseacue/overlays/settings_overlay.dart';
import 'package:reseacue/responsive.dart';

class GiftOpenOverlay extends StatelessWidget {
  const GiftOpenOverlay({
    super.key,
    required this.game,
    required this.mainGame,
  });

  final Reseacue mainGame;
  final GiftSequence game;

  static const String id = 'gift_open_overlay';

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
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
                      containerHeight: Responsive.isSmallScreen(context)
                          ? screenWidth * 0.15
                          : screenWidth * 0.2,
                      containerWidth: Responsive.isSmallScreen(context)
                          ? screenWidth * 0.4
                          : screenWidth * 0.2,
                      shadowContainerHeight: Responsive.isSmallScreen(context)
                          ? screenWidth * 0.13
                          : screenWidth * 0.2,
                      shadowContainerWidth: Responsive.isSmallScreen(context)
                          ? screenWidth * 0.4
                          : screenWidth * 0.2,
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
                    mainGame.overlays.add(SettingsOverlay.id);
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
                    mainGame.audioController.playSfx(SfxType.boxOpen);
                    game.giftAnimation.openGift();
                    game.overlays.remove(id);
                  },
                  buttonText: 'TAP TO OPEN',
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
