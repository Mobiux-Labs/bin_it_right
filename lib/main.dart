import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reseacue/game.dart';

import 'components/modal.dart';

void main() {
  // This is to make sure everything is loaded and initialized before use
  WidgetsFlutterBinding.ensureInitialized();

  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(
      GameWidget.controlled(
      gameFactory: Reseacue.new,
overlayBuilderMap: {
        'Modal' : (BuildContext context, Reseacue game){
          return const Modal();
        }
},
    ),
  );
}
