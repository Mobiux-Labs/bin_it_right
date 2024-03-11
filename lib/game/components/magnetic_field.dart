import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:reseacue/assets.dart';

class MagneticField extends SpriteComponent {
  MagneticField({super.position});

  @override
  FutureOr<void> onLoad() {
    anchor = Anchor.bottomCenter;
    sprite = Sprite(Flame.images.fromCache(AssetConstants.magneticField));

    add(
      OpacityEffect.to(
        0.3,
        EffectController(duration: 0.3, infinite: true, alternate: true),
      ),
    );

    return super.onLoad();
  }
}
