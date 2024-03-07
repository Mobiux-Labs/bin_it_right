import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reseacue/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const splashImage = 'assets/images/splash_screen_image.jpg';

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      GoRouter.of(context).replace(Path.mainMenu);
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const Center(
          child: Image(
            image: AssetImage(splashImage),
          ),
        ),
      ),
    );
  }
}
