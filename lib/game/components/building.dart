import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/components/waste.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/utils/utils.dart';

class Building extends SpriteComponent with HasGameRef<Reseacue> {
  final Logger _log = Logger('Building');

  Building({
    required super.position,
    required super.scale,
    super.anchor,
  });

  @override
  FutureOr<void> onLoad() {
    int randomInteger = getRandomIntegrer(Constants.buildingVariations + 1);
    final buildingNumber = randomInteger == 0 ? 1 : randomInteger;

    sprite = Sprite(Flame.images.fromCache('building_$buildingNumber.png'));

    Waste waste = Waste(
      position: Vector2(width / 2, height / 2),
      scale: Vector2.all(2.0),
    );
    add(waste);
  }

  @override
  void update(double dt) {
    position.y += Reseacue.gameSpeed;

    if (position.y > game.size.y + 100) {
      removeFromParent();
    }

    super.update(dt);
  }
}
