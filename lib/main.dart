import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:reseacue/game.dart';

void main() {
  runApp(
    const GameWidget.controlled(
      gameFactory: Reseacue.new,
    ),
  );
}
