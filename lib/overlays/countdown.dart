import 'package:flutter/material.dart';
import 'package:reseacue/overlays/gradient_overlay.dart';

import '../game/game.dart';

class CountDownOverlay extends StatelessWidget {
  const CountDownOverlay({super.key, required this.game});
  final Reseacue game;

  @override
  Widget build(BuildContext context) {
    return GradientOverlay(child: GestureDetector(onTap:(){
      game.overlays.remove('Countdown');
      //TODO: Add countdown animation here
    },child: const Center(child: Text('GO!'))));
  }
}
