import 'package:flutter/material.dart';
import 'package:reseacue/widgets/overlays/pause_menu.dart';

import '../../main.dart';

class PauseButton extends StatelessWidget {
  static const String ID = 'PauseButton';
  final TrashTrek gameRef;
  const PauseButton({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
        child: TextButton(

      child: const Icon(
        Icons.pause_circle_filled_outlined,
        color: Colors.blueGrey,
      ),
          onPressed: (){
        gameRef.pauseEngine();
        gameRef.overlays.add(PauseMenu.ID);
        gameRef.overlays.remove(PauseButton.ID);
          },
    ),);
  }
}
