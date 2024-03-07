
import 'package:flutter/material.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/pause_menu.dart';


class PauseButton extends StatelessWidget {
  static const String ID = 'PauseButton';
  final Reseacue gameRef;

  const PauseButton({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0,top: 15.0,),
      child: Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              gameRef.pauseEngine();
              gameRef.overlays.add(PauseMenu.ID);
              gameRef.overlays.remove(PauseButton.ID);
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
