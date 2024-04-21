import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reseacue/app/storage/storage.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/app/ui/components/earth_tokens.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/responsive.dart';
import 'package:reseacue/utils/images.dart';
import 'package:reseacue/utils/utils.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GreenWinsGalleryOverlay extends StatelessWidget {
  final StorageController storageController;

  const GreenWinsGalleryOverlay({
    super.key,
    required this.storageController,
  });

  static const String id = 'green_wins_gallery_overlay';

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF51B937),
            Color(0xFFCBDE81),
          ],
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Earth tokens and settings button in a row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: storageController.score,
                      builder: (context, score, child) {
                        return EarthTokens(
                          earthPoints: score,
                          containerHeight: 50,
                          containerWidth: screenHeight * 0.2,
                          shadowContainerHeight: 40,
                          shadowContainerWidth: screenHeight * 0.2,
                        );
                      },
                    ),
                  ],
                ),
                //Green Wins Heading Image
                Image(
                  image: AssetImage(
                      getPathFromAssetString(AssetConstants.greenWinsHeading)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              renderGalleryItems(
                                getPathFromAssetString(
                                    AssetConstants.greenWinsBolt),
                                context,
                                storageController.isBoltLocked.value,
                              ),
                              renderEarthTokens('500', context),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              renderGalleryItems(
                                getPathFromAssetString(
                                  AssetConstants.greenWinsBattery,
                                ),
                                context,
                                storageController.isBatteryLocked.value,
                              ),
                              renderEarthTokens('1000', context),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              renderGalleryItems(
                                getPathFromAssetString(
                                    AssetConstants.greenWinsCan),
                                context,
                                storageController.isCanLocked.value,
                              ),
                              renderEarthTokens('2000', context),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              renderGalleryItems(
                                getPathFromAssetString(
                                    AssetConstants.greenWinsBulb),
                                context,
                                storageController.isBulbLocked.value,
                              ),
                              renderEarthTokens(
                                '4000',
                                context,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              renderGalleryItems(
                                getPathFromAssetString(
                                    AssetConstants.greenWinsBottle),
                                context,
                                storageController.isBottleLocked.value,
                              ),
                              renderEarthTokens('6000', context),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              renderGalleryItems(
                                getPathFromAssetString(
                                    AssetConstants.greenWinsMobile),
                                context,
                                storageController.isPhoneLocked.value,
                              ),
                              renderEarthTokens('8000', context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CustomAnimatedButton(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.7,
                  shadowHeight: 50,
                  shadowWidth: MediaQuery.of(context).size.width / 1.7,
                  screenSize: MediaQuery.of(context).size,
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  buttonText: AppLocalizations.of(context)!.backtoMenu,
                  shadowContainerColor: Constants.redButtonShadowContainerColor,
                  containerColor: Constants.redButtonContainerColor,
                  shineColor: Constants.redButtonShineColor,
                  padding: const EdgeInsets.only(
                    left: 67.0,
                    top: 10.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget renderGalleryItems(String imagePath, context, bool isLocked) {
  return SizedBox(
    height: 100,
    width: MediaQuery.of(context).size.width * 0.5,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: AssetImage(
            getPathFromAssetString(
              isLocked
                  ? AssetConstants.greenWinsLockedCard
                  : AssetConstants.greenWinsCard,
            ),
          ),
        ),
        isLocked
            ? const SizedBox()
            : Image(
                image: AssetImage(
                  getPathFromAssetString(AssetConstants.glow),
                ),
              ),
        isLocked
            ? const SizedBox()
            : Image(
                image: AssetImage(
                  getPathFromAssetString(AssetConstants.greenWinsGlow),
                ),
              ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.height * 0.12,
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 45,
                top: MediaQuery.of(context).size.height / 65,
              ),
              child: Image(
                opacity: AlwaysStoppedAnimation(isLocked ? 0.5 : 1),
                image: AssetImage(
                  imagePath,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget renderEarthTokens(String earthPoints, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SizedBox(
        width: 40,
        height: 40,
        child: FittedBox(
          child: Image(
            image: AssetImage(
              'assets/images/earth_token.png',
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        earthPoints,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.white,
          fontSize: Responsive.isSmallScreen(context) ? 15 : 30,
          fontFamily: 'Digitalt',
          fontWeight: FontWeight.normal,
        ),
      ),
    ],
  );
}
