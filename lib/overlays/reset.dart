import 'package:flutter/material.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/overlays/overlay_container.dart';

import '../game/game.dart';

class ResetOverlay extends StatelessWidget {
  static String id = 'Reset';
  const ResetOverlay({super.key, required this.game});

  final Reseacue game;

  @override
  Widget build(BuildContext context) {
    return OverlayContainer(
      game: game,
      id: id,
      heading: 'RESET?',
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
              height: MediaQuery.of(context).size.height / 13,
              width: MediaQuery.of(context).size.width / 1.5,
              shadowHeight: MediaQuery.of(context).size.height / 15,
              shadowWidth: MediaQuery.of(context).size.width / 1.5,
              screenSize: MediaQuery.of(context).size,
              onTap: () {},
              buttonText: 'YES',
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
              height: MediaQuery.of(context).size.height / 13,
              width: MediaQuery.of(context).size.width / 1.5,
              shadowHeight: MediaQuery.of(context).size.height / 15,
              shadowWidth: MediaQuery.of(context).size.width / 1.5,
              screenSize: MediaQuery.of(context).size,
              onTap: () {},
              buttonText: 'NO',
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
