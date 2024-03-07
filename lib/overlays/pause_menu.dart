import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/overlay_container.dart';
import 'package:reseacue/overlays/pause_button.dart';

class PauseMenu extends StatelessWidget {
  static const String ID = 'PauseMenu';
  final Reseacue gameRef;

  const PauseMenu({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return OverlayContainer(
      heading: 'PAUSED',
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width / 1.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              bottom: 30.0,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    gameRef.resumeEngine();
                    gameRef.overlays.remove(PauseMenu.ID);
                    gameRef.overlays.add(PauseButton.ID);
                  },
                  child: const Image(
                    image: AssetImage(
                      'assets/images/play.png',
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Image(
                        image: AssetImage(
                          'assets/images/settings_icon.png',
                        ),
                      ),
                      const Image(
                        image: AssetImage(
                          'assets/images/sound.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          gameRef.overlays.remove(PauseMenu.ID);
                          gameRef.overlays.add('MainMenu');
                        },
                        child: const Image(
                          image: AssetImage(
                            'assets/images/home.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
