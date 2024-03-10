import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  String? buttonText;
  String? imagePath;
  Color containerColor;
  Color shadowContainerColor;
  Color shineColor;
  EdgeInsets padding;
  Function onTap;
  Size screenSize;
  double width;
  double height;
  double shadowWidth;
  double shadowHeight;

  CustomAnimatedButton({
    super.key,
    this.buttonText,
    this.imagePath,
    required this.shadowContainerColor,
    required this.containerColor,
    required this.shineColor,
    required this.padding,
    required this.onTap,
    required this.screenSize,
    this.height = 100,
    this.width = 100,
    this.shadowHeight = 100,
    this.shadowWidth = 100,
  });

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  static const Color textColor = Color.fromRGBO(
    255,
    255,
    255,
    1,
  );

  static BorderRadius borderRadius = BorderRadius.circular(
    10,
  );

  late double position;

  @override
  void initState() {
    position = 10;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          position = 0;
        });
      },
      onTapUp: (details) {
        setState(() {
          position = 10;
        });
        widget.onTap();
      },
      child: Stack(
        children: [
          Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [
                    0.2,
                    0.8,
                    1
                  ],
                  colors: [
                    Colors.white.withOpacity(0.0),
                    widget.containerColor,
                    widget.containerColor
                  ]),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 30),
            bottom: position,
            child: ClipPath(
              clipper: ClipContainer(),
              child: Container(
                height: widget.shadowHeight,
                width: widget.shadowWidth,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: widget.shadowContainerColor,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 30),
            bottom: position,
            child: ClipPath(
              clipper: ClipContainer2(),
              child: Container(
                height: widget.shadowHeight,
                width: widget.shadowWidth,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: widget.shineColor,
                ),
              ),
            ),
          ),
          Positioned.fill(
            bottom: position,
            child: Center(
              child: widget.imagePath != null && widget.buttonText == null
                  ? Image.asset(widget.imagePath as String)
                  : widget.imagePath == null && widget.buttonText != null
                      ? Text(
                          widget.buttonText as String,
                          style: const TextStyle(
                            fontSize: 30,
                            color: textColor,
                            fontFamily: 'Digitalt',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(widget.imagePath as String),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.buttonText as String,
                              style: const TextStyle(
                                fontSize: 30,
                                color: textColor,
                                fontFamily: 'Digitalt',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                              ),
                            )
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
