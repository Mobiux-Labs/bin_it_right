import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWithShadow extends StatelessWidget {
  String buttonText;
  Color containerColor;
  Color shadowContainerColor;
  Color shineColor;

   ButtonWithShadow({super.key, required this.buttonText,required this.shadowContainerColor, required this.containerColor,required this.shineColor,});

  static const Color textColor = Color.fromRGBO(
    255,
    255,
    255,
    1,
  );

  static BorderRadius borderRadius = BorderRadius.circular(
    10,
  );

  @override
  Widget build(BuildContext context) {

    double containerHeight = MediaQuery.of(context).size.height / 13;
    double containerWidth = MediaQuery.of(context).size.width / 2.2;
    double shadowContainerHeight = MediaQuery.of(context).size.height / 15;
    double shadowContainerWidth = MediaQuery.of(context).size.width / 2.2;
    return Stack(
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
        Padding(
          padding: EdgeInsets.only(
            left: containerWidth/3.3,
            top: 10,
          ),
          child: const Text(
            'START',
            style: TextStyle(
              fontSize: 30,
              color: textColor,
              fontFamily: 'Digitalt',
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}

class ClipContainer2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path =Path();
    path.lineTo((size.width/2)-25, 0.0);
    path.lineTo((size.width/2)+15, size.height - 0.5);
    path.lineTo(0.0, size.height - 0.5);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}

class ClipContainer extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path =Path();
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