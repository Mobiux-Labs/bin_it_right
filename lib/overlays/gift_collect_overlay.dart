import 'package:flutter/material.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/app/ui/components/earth_tokens.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/components/gift.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/game/gift_sequence.dart';
import 'package:reseacue/overlays/gift_opening_overlay.dart';
import 'package:reseacue/overlays/settings_overlay.dart';
import 'package:reseacue/responsive.dart';

import '../utils/number.dart';

class GiftCollectOverlay extends StatefulWidget {
  const GiftCollectOverlay({
    super.key,
    required this.mainGame,
    required this.game,
  });

  final Reseacue mainGame;
  final GiftSequence game;
  static const String id = 'gift_collect_overlay';

  @override
  State<GiftCollectOverlay> createState() => _GiftCollectOverlayState();
}

class _GiftCollectOverlayState extends State<GiftCollectOverlay> {
  String earthTokenImage = 'assets/images/earth_token.png';
  late GiftType giftType;
  String gift = '';
  int giftValue = 0;

  getGiftType() {
    giftType = widget.game.giftAnimation.openGift();
    gift = giftType.toString().split('.').last;
    giftValue = getTokensByGiftType(giftType);
  }

  @override
  void initState() {
    getGiftType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  valueListenable: widget.mainGame.storageController.score,
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
                    widget.mainGame.overlays.add(SettingsOverlay.id);
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
            Center(
              child: Text(
                gift.toUpperCase(),
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: 'Digitalt',
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(
                        6,
                        8,
                      ),
                      blurRadius: 3.0,
                      color: Color.fromRGBO(
                        0,
                        0,
                        0,
                        0.15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                      ),
                      child: Image(
                        image: AssetImage(
                          earthTokenImage,
                        ),
                        fit: BoxFit.fill,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      giftValue.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Digitalt',
                        decoration: TextDecoration.none,
                        fontSize: 31,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomAnimatedButton(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.7,
                  shadowHeight: 50,
                  shadowWidth: MediaQuery.of(context).size.width / 1.7,
                  screenSize: MediaQuery.of(context).size,
                  onTap: () {
                    widget.game.tokensAnimation();
                    widget.game.updateScoreOnRecycle();
                    widget.game.overlays.remove(GiftCollectOverlay.id);
                    widget.mainGame.overlays.remove(GiftOpeningOverlay.id);
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
                  height: 60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
