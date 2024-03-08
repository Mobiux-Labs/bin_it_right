import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EarthTokens extends StatelessWidget {
  EarthTokens({
    super.key,
    required this.earthPoints,
  });

  int earthPoints = 0;
  static const double containerHeight = 50;
  static const double containerWidth = 130;
  static const double shadowContainerHeight = 44;
  static const double shadowContainerWidth = 130;

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

  static BorderRadius borderRadius = BorderRadius.circular(
    10,
  );

  static const Offset imageOffset = Offset(-10, -2.5);
  static const String earthTokenImage = 'assets/images/earth_token.png';

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
          Container(
            height: shadowContainerHeight,
            width: shadowContainerWidth,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: shadowContainerColor,
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
                  earthPoints.toString(),
                  style: TextStyle(
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
