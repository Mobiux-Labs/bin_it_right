import 'package:flutter/material.dart';

class GradientOverlay extends StatelessWidget {
  const GradientOverlay({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(
              53,
              137,
              60,
              1,
            ),
            Color.fromRGBO(
              255,
              255,
              255,
              0,
            ),
            Color.fromRGBO(
              53,
              137,
              60,
              1,
            ),
          ],
        ),
      ),
      child: child,
    );
  }
}
