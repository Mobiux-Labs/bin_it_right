import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reseacue/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const splashImage = 'assets/images/splash_screen.png';

  Future<bool> preloadImages(context) async {
    await precacheImage(
        const AssetImage("assets/images/countdown_1.png"), context);
    await precacheImage(
        const AssetImage("assets/images/countdown_2.png"), context);
    await precacheImage(
        const AssetImage("assets/images/countdown_3.png"), context);
    await precacheImage(
        const AssetImage("assets/images/tutorial_1.png"), context);
    await precacheImage(
        const AssetImage("assets/images/tutorial_2.png"), context);
    await precacheImage(
        const AssetImage("assets/images/tutorial_3.png"), context);
    await precacheImage(
        const AssetImage("assets/images/tutorial_4.png"), context);
    await precacheImage(
        const AssetImage("assets/images/tutorial_5.png"), context);
    await precacheImage(
        const AssetImage("assets/images/tutorial_6.png"), context);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: preloadImages(context),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                GoRouter.of(context).replace(Path.mainMenu);
              });
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Image(
                image: AssetImage(splashImage),
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}
