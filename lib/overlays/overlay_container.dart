import 'package:flutter/material.dart';
import 'package:reseacue/game/game.dart';

class OverlayContainer extends StatelessWidget {
  OverlayContainer({
    super.key,
    required this.child,
    required this.heading,
    required this.width,
    required this.height,
    required this.id,
    required this.game,
  });

  String heading;
  Widget child;
  double height;
  double width;
  String id;
  Reseacue game;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
      ),
      child: Stack(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  height: height + 6,
                  width: width,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(
                      212,
                      175,
                      19,
                      1,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                Container(
                  height: height,
                  width: width,
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
                  ),
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
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.04,
              ),
              child: GestureDetector(
                onTap: () {
                  game.overlays.remove(id);
                },
                child: Image.asset('assets/images/close_button.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
