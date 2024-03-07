import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/pause_button.dart';

class PauseMenu extends StatelessWidget {
  static const String ID = 'PauseMenu';
  final Reseacue gameRef;

  const PauseMenu({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width / 1.2,
          margin: const EdgeInsets.only(
            bottom: 8.0,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: const Color.fromRGBO(
                251,
                206,
                19,
                1,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(
                    212,
                    175,
                    19,
                    1,
                  ),
                  offset: Offset(
                    0.0,
                    1.0,
                  ), //(x,y)
                  blurRadius: 10.0,
                ),
              ]),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: Text('PAUSED',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Digitalt',
                      color: Color.fromRGBO(
                        255,
                        255,
                        255,
                        1,
                      ),
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0, // shadow blur
                          color: Color.fromRGBO(
                            0,
                            0,
                            0,
                            0.15,
                          ), // shadow color
                          offset: Offset(
                            2.0,
                            2.0,
                          ), // how much shadow will be shown
                        ),
                      ],
                      fontSize: 50,
                    )),
              ),
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
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage(
                              'assets/images/settings_icon.png',
                            ),
                          ),
                          Image(
                            image: AssetImage(
                              'assets/images/sound.png',
                            ),
                          ),
                          Image(
                            image: AssetImage(
                              'assets/images/home.png',
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
        ),
      ),
    );
  }
}
