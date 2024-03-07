import 'package:flutter/material.dart';
import 'package:reseacue/overlays/overlay_container.dart';

import '../game/game.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key, required this.game});

  final Reseacue game;

  @override
  Widget build(BuildContext context) {
    return OverlayContainer(
      heading: 'SETTINGS',
      height: MediaQuery.of(context).size.height / 1.8,
      width: MediaQuery.of(context).size.width / 1.15,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 35.0,
          right: 35.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage(
                      'assets/images/sound_on.png',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage(
                      'assets/images/language.png',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage(
                      'assets/images/tutorial.png',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage(
                      'assets/images/reset.png',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage(
                      'assets/images/credits.png',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage(
                      'assets/images/support.png',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 20.0,
              ),
              child: Text(
                'Ver 1.11.17',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Digitalt',
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
