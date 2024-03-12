import 'package:flutter/material.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/app/ui/components/earth_tokens.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/settings_overlay.dart';

class GiftOpenOverlay extends StatelessWidget {
  const GiftOpenOverlay({super.key, required this.game});

  final Reseacue game;

  static const String id = 'gift_open_overlay';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                  valueListenable: game.storageController.score,
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
            )
          ],
        ),
      ),
    );
  }
}
