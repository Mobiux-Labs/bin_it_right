import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:reseacue/game.dart';

void main() {
  // This is to make sure everything is loaded and initialized before use
  WidgetsFlutterBinding.ensureInitialized();

  Flame.device.fullScreen();
  Flame.device.setPortraitUpOnly();

  runApp(
    const GameWidget.controlled(
      gameFactory: Reseacue.new,
    ),
  );
}
