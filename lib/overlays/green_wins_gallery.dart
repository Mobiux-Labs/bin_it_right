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
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Stack(
        children: [
          const Image(
            image: AssetImage(
              'assets/images/gradient_background.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          containerHeight: Responsive.isSmallScreen(context)
                              ? screenWidth * 0.15
                              : screenWidth * 0.2,
                          containerWidth: Responsive.isSmallScreen(context)
                              ? screenWidth * 0.4
                              : screenWidth * 0.2,
                          shadowContainerHeight:
                              Responsive.isSmallScreen(context)
                                  ? screenWidth * 0.13
                                  : screenWidth * 0.2,
                          shadowContainerWidth:
                              Responsive.isSmallScreen(context)
                                  ? screenWidth * 0.4
                                  : screenWidth * 0.2,
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
                              ),
                              renderEarthTokens('2000', context),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
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
                  buttonText: 'BACK TO MENU',
                  shadowContainerColor: Constants.redButtonShadowContainerColor,
                  containerColor: Constants.redButtonContainerColor,
                  shineColor: Constants.redButtonShineColor,
                  padding: const EdgeInsets.only(
                    left: 67.0,
                    top: 10.0,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget renderGalleryItems(String imagePath, context) {
  return SizedBox(
    height: 100,
    width: MediaQuery.of(context).size.width * 0.5,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: AssetImage(
            getPathFromAssetString(AssetConstants.greenWinsCard),
          ),
        ),
        Image(
          image: AssetImage(
            getPathFromAssetString(AssetConstants.glow),
          ),
        ),
        Image(
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
      Image(
        image: const AssetImage(
          'assets/images/earth_token.png',
        ),
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.06,
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        earthPoints,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width * 0.06,
          fontFamily: 'Digitalt',
          fontWeight: FontWeight.normal,
        ),
      ),
    ],
  );
}
