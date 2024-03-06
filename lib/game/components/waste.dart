import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/utils/number.dart';

enum WasteType {
  wet,
  dry,
}

class Waste extends SpriteComponent with HasGameRef<Reseacue> {
  Waste({
    required super.position,
    super.scale,
  });

  @override
  FutureOr<void> onLoad() {
    bool wetWaste = Random().nextBool();

    sprite = Sprite(
        Flame.images.fromCache(wetWaste ? 'wet_waste.png' : 'dry_waste.png'));
    anchor = Anchor.center;
  }
}
