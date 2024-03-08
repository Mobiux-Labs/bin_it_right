import 'package:flutter/material.dart';

class OverlayContainer extends StatelessWidget {
  OverlayContainer({
    super.key,
    required this.child,
    required this.heading,
    required this.width,
    required this.height,
  });

  String heading;
  Widget child;
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        child: Container(
          height: height,
          width: width,
          margin: const EdgeInsets.only(
            bottom: 8.0,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: const Color.fromRGBO(
                251,
                206,
                19,
                1,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(
                    212,
                    175,
                    19,
                    1,
                  ),
                  offset: Offset(
                    0.0,
                    1.0,
                  ), //(x,y)
                  blurRadius: 10.0,
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                ),
                child: Text(heading,
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Digitalt',
                      color: Color.fromRGBO(
                        255,
                        255,
                        255,
                        1,
                      ),
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0, // shadow blur
                          color: Color.fromRGBO(
                            0,
                            0,
                            0,
                            0.15,
                          ), // shadow color
                          offset: Offset(
                            2.0,
                            2.0,
                          ), // how much shadow will be shown
                        ),
                      ],
                      fontSize: 50,
                    )),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

//
