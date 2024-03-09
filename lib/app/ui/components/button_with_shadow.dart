import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonWithShadow extends StatefulWidget {
  String buttonText;
  Color containerColor;
  Color shadowContainerColor;
  Color shineColor;
  EdgeInsets padding;
  Function onTap;
  Size screenSize;

  ButtonWithShadow({
    super.key,
    required this.buttonText,
    required this.shadowContainerColor,
    required this.containerColor,
    required this.shineColor,
    required this.padding,
    required this.onTap,
    required this.screenSize,
  });

  @override
  State<ButtonWithShadow> createState() => _ButtonWithShadowState();
}

class _ButtonWithShadowState extends State<ButtonWithShadow> {
  static const Color textColor = Color.fromRGBO(
    255,
    255,
    255,
    1,
  );

  static BorderRadius borderRadius = BorderRadius.circular(
    10,
  );

  late double containerHeight;
  late double containerWidth;
  late double shadowContainerHeight;
  late double shadowContainerWidth;

  @override
  void initState() {
    containerHeight = widget.screenSize.height / 13;
    containerWidth = widget.screenSize.width / 2.2;
    shadowContainerHeight = widget.screenSize.height / 15;
    shadowContainerWidth = widget.screenSize.width / 2.2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          containerHeight -= 10;
        });
      },
      onTapUp: (details) {
        setState(() {
          containerHeight += 10;
        });
        widget.onTap();
      },
      child: Stack(
        children: [
          AnimatedContainer(
            height: containerHeight,
            width: containerWidth,
            duration: const Duration(milliseconds: 30),
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: widget.containerColor,
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
                color: widget.shadowContainerColor,
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
                color: widget.shineColor,
              ),
            ),
          ),
          Padding(
            padding: widget.padding,
            child: Text(
              widget.buttonText,
              style: const TextStyle(
                fontSize: 30,
                color: textColor,
                fontFamily: 'Digitalt',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
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
    path.lineTo((size.width / 2) - 25, 0.0);
    path.lineTo((size.width / 2) + 15, size.height - 0.5);
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
