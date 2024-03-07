import 'package:flutter/material.dart';
import 'package:reseacue/game/game.dart';

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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(
              53,
              137,
              60,
              1,
            ),
            Color.fromRGBO(
              255,
              255,
              255,
              0,
            ),
            Color.fromRGBO(
              53,
              137,
              60,
              1,
            ),
          ],
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
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
            padding: EdgeInsets.only(
              bottom: 80,
            ),
            child: Image(
              image: AssetImage(
                startButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
