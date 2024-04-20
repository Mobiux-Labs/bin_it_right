import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget largeScreen;
  final Widget smallScreen;
  final Widget mediumScreen;
  const Responsive({
    super.key,
    required this.largeScreen,
    required this.smallScreen,
    required this.mediumScreen,
  });

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width <= 640;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 640 &&
        MediaQuery.of(context).size.width <= 1007;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1007 &&
        MediaQuery.of(context).size.width < 2000;
  }

  static bool isExtraLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 2000;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1008) {
        return largeScreen;
      } else if (constraints.maxWidth <= 1007 && constraints.maxWidth > 640) {
        return mediumScreen;
      } else {
        return smallScreen;
      }
    });
  }
}
