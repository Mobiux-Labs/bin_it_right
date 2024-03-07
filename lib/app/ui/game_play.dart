import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:reseacue/game/game.dart';

Reseacue _reseacue = Reseacue();

class GamePlay extends StatelessWidget {
  const GamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: _reseacue,
    );
  }
}
