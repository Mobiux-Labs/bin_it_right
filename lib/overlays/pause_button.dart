import 'package:flutter/material.dart';
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
          child: GestureDetector(
            onTap: () {
              game.pauseEngine();
              game.overlays.add(PauseMenu.id);
              game.overlays.remove(PauseButton.id);
            },
            child: const Image(
              image: AssetImage(
                'assets/images/pause_icon.png',
              ),
            ),
          )),
    );
  }
}
