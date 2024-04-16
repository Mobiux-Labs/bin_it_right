import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  final String? buttonText;
  final String? imagePath;
  final Color containerColor;
  final Color shadowContainerColor;
  final Color shineColor;
  final EdgeInsets padding;
  final Function onTap;
  final Size screenSize;
  final double width;
  final double height;
  final double shadowWidth;
  final double shadowHeight;
  final Color textColor;
  final bool? diableButton;

  const CustomAnimatedButton({
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
    this.textColor = Colors.white,
    this.diableButton = false,
  });

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
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
    return widget.diableButton == false
        ? GestureDetector(
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
            child: renderCustomButton())
        : renderCustomButton();
  }

  Widget renderCustomButton() {
    return Stack(
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
                ? Image.asset(widget.imagePath as String,height: 35,width: 35,)
                : widget.imagePath == null && widget.buttonText != null
                    ? Text(
                        widget.buttonText as String,
                        style: TextStyle(
                          fontSize: 25,
                          color: widget.textColor,
                          fontFamily: 'Digitalt',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(widget.imagePath as String,height: 35,width: 35,),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.buttonText as String,
                            style: TextStyle(
                              fontSize: 25,
                              color: widget.textColor,
                              fontFamily: 'Digitalt',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          )
                        ],
                      ),
          ),
        ),
        widget.diableButton == true
            ? Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: const Color.fromRGBO(255, 255, 255, 0.3),
                ),
              )
            : const SizedBox(
                height: 0,
              ),
      ],
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
