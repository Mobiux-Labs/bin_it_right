import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/overlays/overlays.dart';

import '../game/game.dart';

class ExitConfirmationOverlay extends StatelessWidget {
  static String id = 'exit_confirmation_overlay';
  const ExitConfirmationOverlay({super.key, required this.game});

  final Reseacue game;

  @override
  Widget build(BuildContext context) {
    return OverlayContainer(
      game: game,
      id: id,
      heading: 'LEAVING?',
      height: MediaQuery.of(context).size.height / 2.8,
      width: MediaQuery.of(context).size.width / 1.2,
      onClose: () {},
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 25.0,
        ),
        child: Column(
          children: [
            CustomAnimatedButton(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.5,
              shadowHeight: 40,
              shadowWidth: MediaQuery.of(context).size.width / 1.5,
              screenSize: MediaQuery.of(context).size,
              onTap: () {
                game.overlays.remove(id);
              },
              buttonText: 'STAY',
              shadowContainerColor: Constants.greenButtonShadowContainerColor,
              containerColor: Constants.greenButtonContainerColor,
              shineColor: Constants.greenButtonShineColor,
              padding: const EdgeInsets.only(
                left: 67.0,
                top: 10.0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomAnimatedButton(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.5,
              shadowHeight: 40,
              shadowWidth: MediaQuery.of(context).size.width / 1.5,
              screenSize: MediaQuery.of(context).size,
              onTap: () {
                exit(0);
              },
              buttonText: 'LEAVE',
              shadowContainerColor: Constants.redButtonShadowContainerColor,
              containerColor: Constants.redButtonContainerColor,
              shineColor: Constants.redButtonShineColor,
              padding: const EdgeInsets.only(
                left: 75.0,
                top: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
