import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/game/game.dart';

class Vehicle extends SpriteComponent with HasGameRef<Reseacue> {
  final Logger _log = Logger('Vehicle');

  Vehicle({
    required super.position,
    super.scale,
  });

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(
      Flame.images.fromCache('vehicle_1.png'),
    );

    anchor = Anchor.bottomCenter;
  }
}
