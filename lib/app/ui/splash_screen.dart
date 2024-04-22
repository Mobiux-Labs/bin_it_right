import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/responsive.dart';
import 'package:reseacue/utils/utils.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  ValueNotifier<double> loadedAssetsPercentage = ValueNotifier<double>(-1.0);
  int factIndex = getRandomIntegrerInRange(0, 10);
  int changeFactIndex = 0;

  Future<bool> preloadImages(context) async {
    int totalAssets = AssetConstants.assets.length + sprites.length;
    int loadedAssets = -1;

    for (String asset in AssetConstants.treeAnimationFrames) {
      await precacheImage(AssetImage(getPathFromAssetString(asset)), context);
    }

    loadedAssets = 0;
    loadedAssetsPercentage.value = 0;

    for (String sprite in sprites) {
      await Flame.images.load(sprite);
      loadedAssets += 1;
      loadedAssetsPercentage.value = (loadedAssets / totalAssets) * 100;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    double loaderContainerWidthFactor = 1.2;
    if (Responsive.isMediumScreen(context)) {
      loaderContainerWidthFactor = 3;
    } else if (Responsive.isLargeScreen(context)) {
      loaderContainerWidthFactor = 6;
    } else if (Responsive.isExtraLargeScreen(context)) {
      loaderContainerWidthFactor = 8;
    }

    return Scaffold(
      body: FutureBuilder(
          future: preloadImages(context),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              imageCache.clear();
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  GoRouter.of(context).replace(Path.startGameOverlay);
                },
              );
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: AssetImage(
                          getPathFromAssetString(
                            Responsive.isSmallScreen(context)
                                ? AssetConstants.splashLoading
                                : AssetConstants.splashLoadingXl,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: loadedAssetsPercentage,
                          builder: (context, value, child) {
                            if (loadedAssetsPercentage.value.round() % 25 ==
                                0) {
                              if (changeFactIndex <
                                  loadedAssetsPercentage.value.round()) {
                                factIndex = getRandomIntegrerInRange(0, 10);
                                changeFactIndex =
                                    loadedAssetsPercentage.value.round();
                              }
                            }
                            return renderFunFact(
                              context,
                              factIndex,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width /
                                loaderContainerWidthFactor,
                            child: FittedBox(
                              child: ValueListenableBuilder(
                                valueListenable: loadedAssetsPercentage,
                                builder: ((context, value, child) {
                                  return FadeInImage(
                                      placeholderFit: BoxFit.scaleDown,
                                      placeholder: MemoryImage(
                                        kTransparentImage,
                                      ),
                                      image: AssetImage(
                                        getPathFromAssetString(
                                            loadedAssetsPercentage.value == -1.0
                                                ? AssetConstants
                                                    .treeAnimationFirstFrame
                                                : 'Tree animation_${getFromRange(loadedAssetsPercentage.value.round(), 0, 100, 1, 45).round()}.png'),
                                      ));
                                }),
                              ),
                            )),
                        ValueListenableBuilder(
                          valueListenable: loadedAssetsPercentage,
                          builder: ((context, value, child) {
                            return Text(
                              loadedAssetsPercentage.value == -1.0
                                  ? '0.0 %'
                                  : '${loadedAssetsPercentage.value.toStringAsFixed(2)} %',
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontFamily: 'Digitalt',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget renderFunFact(context, factIndex) {
    double containerWidthFactor = 1.2;
    if (Responsive.isExtraLargeScreen(context)) {
      containerWidthFactor = 3;
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width / containerWidthFactor,
      child: Stack(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height / 8) + 5,
            width: MediaQuery.of(context).size.width / containerWidthFactor,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(
                105,
                127,
                21,
                0.8,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 8,
            width: MediaQuery.of(context).size.width / containerWidthFactor,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(
                133,
                159,
                30,
                1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(
                  15.0,
                ),
                child: AutoSizeText(
                  Constants.recyclingFacts[factIndex],
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Digitalt',
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                  maxLines: 5,
                  minFontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
