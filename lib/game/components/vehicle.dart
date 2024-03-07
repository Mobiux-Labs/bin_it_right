import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';

class Vehicle extends SpriteComponent with HasGameRef<Reseacue> {
  // ignore: unused_field
  final Logger _log = Logger(Constants.vehicleLoggerKey);

  Vehicle({
    required super.position,
    super.scale,
  });

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(
      Flame.images.fromCache(AssetConstants.vehicleS),
    );

    anchor = Anchor.bottomCenter;
  }
}
