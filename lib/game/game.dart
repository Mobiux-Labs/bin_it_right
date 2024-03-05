import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/game/components/garbage.dart';
import '../assets.dart' as ASSETS;

class Reseacue extends FlameGame {
  static const double gameSpeed = 1.0;

  // Enable this if hitbox boundary has to be seen
  @override
  bool debugMode = false;

  @override
  FutureOr<void> onLoad() async {
    await Flame.images.loadAll(sprites);

    camera.viewfinder.anchor = Anchor.topLeft;

    final Garbage garbage = Garbage(
      garbageGenericType: GarbageGenericType.dry,
      garbageType: GarbageType.paper,
      position: Vector2.all(0.0),
      assetSrc: ASSETS.garbageBag,
      size: Vector2.all(100.0),
      anchor: Anchor.topLeft,
    );

    world.add(garbage);
  }
}
