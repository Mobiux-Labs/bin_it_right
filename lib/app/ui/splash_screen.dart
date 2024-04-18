import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/utils/images.dart';
import 'package:reseacue/utils/number.dart';
import 'package:transparent_image/transparent_image.dart';

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

    for (String asset in AssetConstants.assets) {
      await precacheImage(AssetImage(getPathFromAssetString(asset)), context);
      loadedAssets += 1;
      loadedAssetsPercentage.value = (loadedAssets / totalAssets) * 100;
    }

    for (String sprite in sprites) {
      await Flame.images.load(sprite);
      loadedAssets += 1;
      loadedAssetsPercentage.value = (loadedAssets / totalAssets) * 100;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: preloadImages(context),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
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
                  FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: AssetImage(
                      getPathFromAssetString(AssetConstants.splashLoading),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Column(
                          children: [
                            ValueListenableBuilder(
                                valueListenable: loadedAssetsPercentage,
                                builder: (context, value, child) {
                                  if (loadedAssetsPercentage.value.round() %
                                          25 ==
                                      0) {
                                    if (changeFactIndex <
                                        loadedAssetsPercentage.value.round()) {
                                      factIndex =
                                          getRandomIntegrerInRange(0, 10);
                                      changeFactIndex =
                                          loadedAssetsPercentage.value.round();
                                    }
                                  }
                                  return renderFunFact(
                                    context,
                                    factIndex,
                                  );
                                }),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: ValueListenableBuilder(
                                valueListenable: loadedAssetsPercentage,
                                builder: ((context, value, child) {
                                  return FadeInImage(
                                    placeholder: MemoryImage(
                                      kTransparentImage,
                                    ),
                                    image: loadedAssetsPercentage.value == -1.0
                                        ? AssetImage(
                                            getPathFromAssetString(
                                              AssetConstants
                                                  .treeAnimationFirstFrame,
                                            ),
                                          )
                                        : AssetImage(
                                            getPathFromAssetString(
                                              'Tree animation_${getFromRange(loadedAssetsPercentage.value.round(), 0, 100, 1, 45).round()}.png',
                                            ),
                                          ),
                                  );
                                }),
                              ),
                            ),
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
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget renderFunFact(context, factIndex) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Stack(
        children: [
          Container(
            height: 105,
            width: MediaQuery.of(context).size.width / 1.2,
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
            height: 100,
            width: MediaQuery.of(context).size.width / 1.2,
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
            child: Padding(
                padding: const EdgeInsets.all(
                  15.0,
                ),
                child: AutoSizeText(
                  Constants.recyclingFacts[factIndex],
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: 'Digitalt',
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                  maxLines: 5,
                )),
          ),
        ],
      ),
    );
  }
}
