import 'package:flutter/material.dart';
import 'package:reseacue/overlays/overlay_container.dart';

import '../game/game.dart';

class ResetOverlay extends StatelessWidget {
  const ResetOverlay({super.key, required this.game});

  final Reseacue game;

  @override
  Widget build(BuildContext context) {
    return OverlayContainer(
      heading: 'RESET?',
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width / 1.2,
      child: const Padding(
        padding: EdgeInsets.only(
          bottom: 25.0,
        ),
        child: Column(
          children: [
            Image(
              image: AssetImage(
                'assets/images/yes_button.png',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image(
              image: AssetImage(
                'assets/images/no_button.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
