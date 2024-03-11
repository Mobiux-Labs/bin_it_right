import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/utils/images.dart';
import 'package:transparent_image/transparent_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  final values = [];
  ValueNotifier<int> _index = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    for (int treeAnimationFrameIndex = 1;
        treeAnimationFrameIndex <= 45;
        treeAnimationFrameIndex++) {
      values.add(treeAnimationFrameIndex.toString());
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<bool> preloadImages(context) async {
    for (String asset in AssetConstants.assets) {
      await precacheImage(AssetImage(getPathFromAssetString(asset)), context);
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
              timer =
                  Timer.periodic(const Duration(milliseconds: 300), (timer) {
                _index.value += 1;
                if (_index.value == 45) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) {
                      GoRouter.of(context).replace(Path.startGameOverlay);
                    },
                  );
                }
              });
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: AssetImage(
                          getPathFromAssetString(AssetConstants.splashLoading)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: ValueListenableBuilder(
                              valueListenable: _index,
                              builder: (context, data, child) {
                                return FadeInImage(
                                  placeholder: MemoryImage(kTransparentImage),
                                  image: AssetImage(
                                    getPathFromAssetString(
                                        'Tree animation_${values[data % values.length]}.png'),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Text(
                            'Loading...',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontFamily: 'Digitalt',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image(
                image: AssetImage(
                  getPathFromAssetString(
                    AssetConstants.splashScreen,
                  ),
                ),
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}
