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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const Image(
          image: AssetImage(splashImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
