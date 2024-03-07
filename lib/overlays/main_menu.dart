import 'package:flutter/material.dart';
import 'package:reseacue/game/game.dart';


class MainMenu extends StatelessWidget {
  // Reference to parent game.
  final Reseacue game;

  const MainMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(53, 137, 60, 1),
            Color.fromRGBO(255, 255, 255, 0),
            Color.fromRGBO(53, 137, 60, 1),
          ],
        ),
      ),
    );
  }
}