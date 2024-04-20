import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EarthTokens extends StatelessWidget {
  const EarthTokens({
    super.key,
    required this.earthPoints,
    required this.containerHeight,
    required this.containerWidth,
    required this.shadowContainerHeight,
    required this.shadowContainerWidth,
  });

  final int earthPoints;
  final double containerHeight;
  final double containerWidth;
  final double shadowContainerHeight;
  final double shadowContainerWidth;

  static const Color containerColor = Color.fromRGBO(
    212,
    175,
    19,
    1,
  );
  static const Color shadowContainerColor = Color.fromRGBO(
    251,
    206,
    19,
    1,
  );
  static const Color textColor = Color.fromRGBO(
    255,
    255,
    255,
    1,
  );

  static const Color shineColor = Color.fromRGBO(
    212,
    175,
    19,
    0.5,
  );

  static BorderRadius borderRadius = BorderRadius.circular(
    10,
  );

  static const Offset imageOffset = Offset(-10, -2.5);
  static const String earthTokenImage = 'assets/images/earth_token.png';

  String formatScore(int score) {
    if (score < 1000) {
      return score.toString();
    } else if (score < 10000) {
      return '${(score ~/ 1000)}K';
    } else if (score < 100000) {
      return '${(score ~/ 1000)}K';
    } else if (score < 1000000) {
      return '${(score ~/ 1000)}K';
    } else if (score < 10000000) {
      return '${(score ~/ 1000000)}M';
    } else if (score < 100000000) {
      return '${(score ~/ 1000000)}M';
    } else {
      return 'Max Score Reached';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Stack(
        children: [
          Container(
            height: containerHeight,
            width: containerWidth,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: containerColor,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(
                    0,
                    0,
                    0,
                    0.15,
                  ),
                  offset: Offset(
                    0.0,
                    1.0,
                  ), //(x,y)
                  blurRadius: 10.0,
                ),
              ],
            ),
          ),
          ClipPath(
            clipper: ClipContainer(),
            child: Container(
              height: shadowContainerHeight,
              width: shadowContainerWidth,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: shadowContainerColor,
              ),
            ),
          ),
          ClipPath(
            clipper: ClipContainer2(),
            child: Container(
              height: shadowContainerHeight,
              width: shadowContainerWidth,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: shineColor,
              ),
            ),
          ),
          Row(
            children: [
              Transform.translate(
                offset: imageOffset,
                child: const Image(
                  image: AssetImage(
                    earthTokenImage,
                  ),
                  fit: BoxFit.fill,
                  height: 55,
                  width: 55,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Text(
                  formatScore(earthPoints),
                  style: const TextStyle(
                    fontSize: 27,
                    color: textColor,
                    fontFamily: 'Digitalt',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ClipContainer2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(45.0, 0.0);
    path.lineTo(60.0, size.height - 0.5);
    path.lineTo(0.0, size.height - 0.5);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ClipContainer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(45.0, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
