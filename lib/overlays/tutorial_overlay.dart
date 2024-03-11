import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reseacue/overlays/overlays.dart';
import 'package:transparent_image/transparent_image.dart';

import '../game/game.dart';

class TutorialOverlay extends StatefulWidget {
  static String id = 'tutorial_overlay';
  final Reseacue game;
  const TutorialOverlay({super.key, required this.game});

  @override
  State<TutorialOverlay> createState() => _TutorialOverlayState();
}

class _TutorialOverlayState extends State<TutorialOverlay> {
  late final Timer timer;

  final values = [];
  int _index = 0;

  @override
  void initState() {
    super.initState();
    for (int tutorialImageIndex = 1;
        tutorialImageIndex <= 6;
        tutorialImageIndex++) {
      values.add(tutorialImageIndex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientOverlay(
      child: GestureDetector(
        onTap: () {
          if (_index < 5) {
            setState(() {
              _index += 1;
            });
          } else {
            widget.game.overlays.remove(TutorialOverlay.id);
          }
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
            ),
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(
                  'assets/images/tutorial_${values[_index % values.length]}.png'),
            ),
          ),
        ),
      ),
    );
  }
}
