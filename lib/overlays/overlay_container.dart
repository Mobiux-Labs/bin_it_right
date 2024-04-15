import 'package:flutter/material.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';

class OverlayContainer extends StatelessWidget {
  const OverlayContainer({
    super.key,
    required this.child,
    required this.heading,
    required this.width,
    required this.height,
    required this.id,
    required this.game,
    required this.onClose,
  });

  final String heading;
  final Widget child;
  final double height;
  final double width;
  final String id;
  final Reseacue game;
  final Function onClose;

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
                                  offset: Offset(
                                    5,
                                    4,
                                  ),
                                  blurRadius: 3.0,
                                  color: Color.fromRGBO(
                                    0,
                                    0,
                                    0,
                                    0.15,
                                  ),
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
              child: CustomAnimatedButton(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width / 6,
                shadowHeight: MediaQuery.of(context).size.height / 15,
                shadowWidth: MediaQuery.of(context).size.width / 6,
                screenSize: MediaQuery.of(context).size,
                onTap: () {
                  onClose();
                  game.overlays.remove(id);
                },
                imagePath: 'assets/images/close.png',
                shadowContainerColor: Constants.redButtonShadowContainerColor,
                containerColor: Constants.redButtonContainerColor,
                shineColor: Constants.redButtonShineColor,
                padding: const EdgeInsets.only(
                  left: 67.0,
                  top: 10.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
