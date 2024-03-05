import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(
      game: TrashTrek(),
    ),
  );
}

class TrashTrek extends FlameGame {
  @override
  void onLoad() async {
    super.onLoad();
    ParallaxComponent road = await loadParallaxComponent(
      [
        ParallaxImageData(
          'road.png',
        ),
      ],
      baseVelocity: Vector2(
        0,
        -100,
      ),
      repeat: ImageRepeat.repeatY,
      fill: LayerFill.width
    );
    add(road);
  }
}
