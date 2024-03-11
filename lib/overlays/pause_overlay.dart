import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reseacue/app/settings/settings.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/overlays.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PauseOverlay extends StatelessWidget {
  static const String id = 'pause_overlay';
  final Reseacue game;

  const PauseOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    double containerWidth = 60;
    double containerHeight = 60;
    double shadowContainerHeight = 50;

    SettingsController settingsController = context.watch<SettingsController>();

    return OverlayContainer(
      game: game,
      id: id,
      heading: AppLocalizations.of(context)!.paused,
      height: MediaQuery.of(context).size.height / 2.7,
      width: MediaQuery.of(context).size.width / 1.2,
      onClose: () {
        game.resumeEngine();
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
                  buttonText: AppLocalizations.of(context)!.play,
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
                        onTap: () {
                          game.overlays.add(SettingsOverlay.id);
                        },
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
                      ValueListenableBuilder(
                        valueListenable: settingsController.muted,
                        builder: (context, muted, child) {
                          return CustomAnimatedButton(
                            height: containerHeight,
                            width: containerWidth,
                            shadowHeight: shadowContainerHeight,
                            shadowWidth: containerWidth,
                            screenSize: MediaQuery.of(context).size,
                            onTap: () {
                              settingsController.toggleMuted();
                            },
                            imagePath: settingsController.muted.value == true
                                ? 'assets/images/sound_off.png'
                                : 'assets/images/sound_on.png',
                            shadowContainerColor:
                                Constants.redButtonShadowContainerColor,
                            containerColor: Constants.redButtonContainerColor,
                            shineColor: Constants.redButtonShineColor,
                            padding: const EdgeInsets.only(
                              left: 67.0,
                              top: 10.0,
                            ),
                          );
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: settingsController.vibrationOn,
                        builder: (context, vibrationOn, child) {
                          return CustomAnimatedButton(
                            height: containerHeight,
                            width: containerWidth,
                            shadowHeight: shadowContainerHeight,
                            shadowWidth: containerWidth,
                            screenSize: MediaQuery.of(context).size,
                            onTap: () {
                              settingsController.toggleVibration();
                            },
                            imagePath:
                                settingsController.vibrationOn.value == true
                                    ? 'assets/images/vibration_on.png'
                                    : 'assets/images/vibration_off.png',
                            shadowContainerColor:
                                Constants.redButtonShadowContainerColor,
                            containerColor: Constants.redButtonContainerColor,
                            shineColor: Constants.redButtonShineColor,
                            padding: const EdgeInsets.only(
                              left: 67.0,
                              top: 10.0,
                            ),
                          );
                        },
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
                          game.overlays.add(StartGameOverlay.id);
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
