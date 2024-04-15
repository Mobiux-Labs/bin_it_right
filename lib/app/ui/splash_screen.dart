import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/utils/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  GoRouter.of(context).replace('/start_game');
                },
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
