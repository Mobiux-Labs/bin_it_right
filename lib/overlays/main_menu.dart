import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/gradient_overlay.dart';

class MainMenu extends StatelessWidget {
  // Reference to parent game.
  final Reseacue game;

  const MainMenu({super.key, required this.game});

  static const startButton = 'assets/images/start_button.png';
  static const settingsIcon = 'assets/images/settings.png';
  static const leaderboardIcon = 'assets/images/leaderboard.png';
  static const earthToken = 'assets/images/earth_tokens.png';

  @override
  Widget build(BuildContext context) {

    return GradientOverlay(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(
              10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage(
                    earthToken,
                  ),
                ),
                Row(
                  children: [
                    Image(
                      image: AssetImage(
                        leaderboardIcon,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage(
                        settingsIcon,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 80,
            ),
            child: GestureDetector(
              onTap: () {
                game.overlays.remove('MainMenu');
                game.overlays.add('Countdown');
              },
              child: const Image(
                image: AssetImage(
                  startButton,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}