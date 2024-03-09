import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reseacue/overlays/gradient_overlay.dart';

import '../game/game.dart';

class CountDownOverlay extends StatefulWidget {
  final Reseacue game;
  const CountDownOverlay({super.key, required this.game});

  @override
  State<CountDownOverlay> createState() => _CountDownOverlayState();
}

class _CountDownOverlayState extends State<CountDownOverlay> {
  late final Timer timer;

  final values = ['3', '2', '1'];
  int _index = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _index++;
      });
      if (_index == 3) {
        widget.game.overlays.remove('Countdown');
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientOverlay(
      child: GestureDetector(
        onTap: () {
          widget.game.overlays.remove('Countdown');
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: Image(
              image: AssetImage(
                  'assets/images/countdown_${values[_index % values.length]}.png'),
            ),
          ),
        ),
      ),
    );
  }
}
