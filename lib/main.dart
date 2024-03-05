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
    //Load road image
    ParallaxComponent road = await loadParallaxComponent([
      ParallaxImageData(
        'road.png',
      ),
    ],
        //Set velocity
        baseVelocity: Vector2(
          0,
          -100,
        ),
        repeat: ImageRepeat.repeatY,
        fill: LayerFill.width);
    add(road);
    add(
      SpriteComponent(
        position: size/1.55,
        anchor: Anchor.topCenter,
        sprite: await loadSprite(
          'mini_truck.png',
          srcSize: Vector2(
            350,
            400,
          ),
        ),
      ),
    );
  }
}
