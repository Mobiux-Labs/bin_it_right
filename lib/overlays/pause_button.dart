import 'package:flutter/material.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/pause_menu.dart';

class PauseButton extends StatelessWidget {
  static const String id = 'PauseButton';
  final Reseacue game;

  const PauseButton({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15.0,
        top: 15.0,
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: CustomAnimatedButton(
          height: 50,
          width: 50,
          shadowHeight: 40,
          shadowWidth: 50,
          screenSize: MediaQuery.of(context).size,
          onTap: () {
            game.pauseEngine();
            game.overlays.add(PauseMenu.id);
            game.overlays.remove(PauseButton.id);
          },
          imagePath: 'assets/images/pause.png',
          shadowContainerColor: Constants.yellowButtonShadowContainerColor,
          containerColor: Constants.yellowButtonContainerColor,
          shineColor: Constants.yellowButtonShineColor,
          padding: const EdgeInsets.only(
            left: 50,
            top: 10.0,
          ),
        ),
      ),
    );
  }
}
