import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reseacue/components/progress_bar.dart';
import 'package:reseacue/game.dart';
import 'package:reseacue/splash_screen.dart';

import 'components/modal.dart';

void main() {
  // This is to make sure everything is loaded and initialized before use
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      home: SplashScreen(),
    ),
  );
}
