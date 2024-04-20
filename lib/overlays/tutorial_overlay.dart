import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reseacue/app/storage/storage.dart';
import 'package:reseacue/overlays/overlays.dart';
import 'package:reseacue/responsive.dart';
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
        tutorialImageIndex <= 7;
        tutorialImageIndex++) {
      values.add(tutorialImageIndex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    StorageController storageController = context.watch<StorageController>();

    if (storageController.tutorialWatched.value == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.game.overlays.remove(TutorialOverlay.id);
      });
    }

    return GradientOverlay(
      child: GestureDetector(
        onTap: () {
          if (_index < 6) {
            setState(() {
              _index += 1;
            });
          } else {
            storageController.watchedTutorial();
            widget.game.overlays.remove(TutorialOverlay.id);
          }
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
            ),
            child: FittedBox(
              fit: BoxFit.contain,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: AssetImage(Responsive.isSmallScreen(context)
                    ? 'assets/images/tutorial_${values[_index % values.length]}.png'
                    : 'assets/images/tutorial_${values[_index % values.length]}_xl.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
