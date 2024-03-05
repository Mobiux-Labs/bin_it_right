import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:reseacue/assets.dart';

class Reseacue extends FlameGame {
  static const double gameSpeed = 1.0;

  // Enable this if hitbox boundary has to be seen
  @override
  // ignore: overridden_fields
  bool debugMode = false;

  @override
  FutureOr<void> onLoad() async {
    await Flame.images.loadAll(sprites);

    camera.viewfinder.anchor = Anchor.topLeft;
  }
}
