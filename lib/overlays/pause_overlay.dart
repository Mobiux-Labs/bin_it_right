import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/overlay_container.dart';
import 'package:reseacue/overlays/gameplay_overlay.dart';

class PauseOverlay extends StatelessWidget {
  static const String id = 'pause_overlay';
  final Reseacue game;

  const PauseOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    double containerWidth = 60;
    double containerHeight = 60;
    double shadowContainerHeight = 50;

    return OverlayContainer(
      game: game,
      id: id,
      heading: 'PAUSED',
      height: MediaQuery.of(context).size.height / 2.7,
      width: MediaQuery.of(context).size.width / 1.2,
      onClose: () {
        game.resumeEngine();
        game.overlays.add(GamePlayOverlay.id);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              bottom: 30.0,
            ),
            child: Column(
              children: [
                CustomAnimatedButton(
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width / 1.5,
                  shadowHeight: MediaQuery.of(context).size.height / 15,
                  shadowWidth: MediaQuery.of(context).size.width / 1.5,
                  screenSize: MediaQuery.of(context).size,
                  onTap: () {
                    game.resumeEngine();
                    game.overlays.remove(PauseOverlay.id);
                    game.overlays.add(GamePlayOverlay.id);
                  },
                  buttonText: 'PLAY',
                  imagePath: 'assets/images/play.png',
                  shadowContainerColor: Constants.redButtonShadowContainerColor,
                  containerColor: Constants.redButtonContainerColor,
                  shineColor: Constants.redButtonShineColor,
                  padding: const EdgeInsets.only(
                    left: 67.0,
                    top: 10.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomAnimatedButton(
                        height: containerHeight,
                        width: containerWidth,
                        shadowHeight: shadowContainerHeight,
                        shadowWidth: containerWidth,
                        screenSize: MediaQuery.of(context).size,
                        onTap: () {},
                        imagePath: 'assets/images/settings.png',
                        shadowContainerColor:
                            Constants.redButtonShadowContainerColor,
                        containerColor: Constants.redButtonContainerColor,
                        shineColor: Constants.redButtonShineColor,
                        padding: const EdgeInsets.only(
                          left: 67.0,
                          top: 10.0,
                        ),
                      ),
                      CustomAnimatedButton(
                        height: containerHeight,
                        width: containerWidth,
                        shadowHeight: shadowContainerHeight,
                        shadowWidth: containerWidth,
                        screenSize: MediaQuery.of(context).size,
                        onTap: () {},
                        imagePath: 'assets/images/sound_on.png',
                        shadowContainerColor:
                            Constants.redButtonShadowContainerColor,
                        containerColor: Constants.redButtonContainerColor,
                        shineColor: Constants.redButtonShineColor,
                        padding: const EdgeInsets.only(
                          left: 67.0,
                          top: 10.0,
                        ),
                      ),
                      CustomAnimatedButton(
                        height: containerHeight,
                        width: containerWidth,
                        shadowHeight: shadowContainerHeight,
                        shadowWidth: containerWidth,
                        screenSize: MediaQuery.of(context).size,
                        onTap: () {},
                        imagePath: 'assets/images/vibration_on.png',
                        shadowContainerColor:
                            Constants.redButtonShadowContainerColor,
                        containerColor: Constants.redButtonContainerColor,
                        shineColor: Constants.redButtonShineColor,
                        padding: const EdgeInsets.only(
                          left: 67.0,
                          top: 10.0,
                        ),
                      ),
                      CustomAnimatedButton(
                        height: containerHeight,
                        width: containerWidth,
                        shadowHeight: shadowContainerHeight,
                        shadowWidth: containerWidth,
                        screenSize: MediaQuery.of(context).size,
                        onTap: () {
                          game.restart();
                          game.overlays.remove(PauseOverlay.id);
                          game.overlays.add('StartGameOverlay');
                        },
                        imagePath: 'assets/images/home.png',
                        shadowContainerColor:
                            Constants.redButtonShadowContainerColor,
                        containerColor: Constants.redButtonContainerColor,
                        shineColor: Constants.redButtonShineColor,
                        padding: const EdgeInsets.only(
                          left: 67.0,
                          top: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
