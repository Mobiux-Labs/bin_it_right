import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});
  // ignore: unused_field
  static final Logger _log = Logger(Constants.mainMenuLoggerKey);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Align(
        alignment: Alignment.center,
        child: GameWidget(
          game: Reseacue(),
        ),
      ),
    );
  }
}
