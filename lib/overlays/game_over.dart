import 'package:flutter/material.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/overlay_container.dart';

class GameOver extends StatelessWidget {
  static String id = 'GameOver';
  const GameOver({super.key, required this.game});

  final Reseacue game;

  @override
  Widget build(BuildContext context) {
    return OverlayContainer(
      game: game,
      id: id,
      heading: 'BIN BOSS!',
      height: MediaQuery.of(context).size.height / 1.8,
      width: MediaQuery.of(context).size.width / 1.15,
      onClose: () {},
      child: const Padding(
        padding: EdgeInsets.only(
          bottom: 30.0,
        ),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/score.png'),
            ),
            SizedBox(
              height: 30.0,
            ),
            Image(
              image: AssetImage(
                'assets/images/best.png',
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage(
                    'assets/images/home.png',
                  ),
                ),
                Image(
                  image: AssetImage(
                    'assets/images/replay.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
