import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/overlays.dart';

class LoadingOverlay extends StatefulWidget {
  static const String id = 'Loading';

  final Reseacue game;

  const LoadingOverlay({
    super.key,
    required this.game,
  });

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay> {
  late final Timer timer;

  final List<String> values = [];
  int _index = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= 45; i++) {
      values.add(i.toString());
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _index++;
      });
      if (_index == 44) {
        widget.game.overlays.add(StartGameOverlay.id);
        widget.game.overlays.remove(LoadingOverlay.id);
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFCBDE81),
            Color(0xFF9FB937),
          ],
        ),
      ),
      child: Column(
        children: [
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 30),
              child: Image(
                image: AssetImage(
                    'assets/images/Tree animation_${values[_index % values.length]}.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
