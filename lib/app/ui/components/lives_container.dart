import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LivesContainer extends StatelessWidget {
  const LivesContainer({
    super.key,
    required this.lives,
  });

  final int lives;
  final double containerHeight = 50;
  final double containerWidth = 140;
  final double shadowContainerHeight = 44;
  final double shadowContainerWidth = 140;

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

  final Offset imageOffset = const Offset(-10, -2.5);
  final String aliveImage = 'assets/images/alive.png';
  final String lifeOverImage = 'assets/images/life_over.png';

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
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      lives > 0 ? aliveImage : lifeOverImage,
                    ),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    image: AssetImage(
                      lives > 1 ? aliveImage : lifeOverImage,
                    ),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    image: AssetImage(
                      lives > 2 ? aliveImage : lifeOverImage,
                    ),
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
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
