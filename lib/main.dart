import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(
    GameWidget(
      game: TrashTrek(),
    ),
  );
}

class TrashTrek extends FlameGame {

  @override
  bool debugMode = true;
  @override
  Color backgroundColor() => const Color(0xFFE7DFC1);

  @override
  void onLoad() async {
    super.onLoad();
    //Load images to Flame image object
    await Flame.images.loadAll(['road_background.png','grass_left_side.png','grass_right_side.png']);

    camera.viewfinder.anchor = Anchor.topLeft;

    final roadImage = Flame.images.fromCache('road_background.png');
    final grassLeftImage = Flame.images.fromCache('grass_left_side.png');
    final grassRightImage = Flame.images.fromCache('grass_right_side.png');

    Sprite road = Sprite(roadImage);
    SpriteComponent roadComponent = SpriteComponent(
      sprite: road,
      anchor: Anchor.topCenter,
      position: Vector2(size.x / 2, 0), //road is rendered to center of the screen
      size: Vector2(
        (size.x * 41) / 100, //41% of screen is covered with road
        size.y,
      ),
    );

    world.add(roadComponent);

    ParallaxComponent roadStripes = await loadParallaxComponent(
      [
        ParallaxImageData(
          'road_stripes.png',
        ),
      ],
      position: Vector2(size.x / 2, 0),
      //Set velocity
      baseVelocity: Vector2(
        0,
        -100,
      ),
      repeat: ImageRepeat.repeatY,
    );
    world.add(roadStripes);

    ParallaxComponent leftGrassComponent = await loadParallaxComponent(
      [
        ParallaxImageData(
          'grass_left_side.png',
        ),
      ],
      //Set velocity
      baseVelocity: Vector2(
        0,
        -100,
      ),
      repeat: ImageRepeat.repeatY,
    );
    world.add(leftGrassComponent);

    ParallaxComponent rightGrassComponent = await loadParallaxComponent(
      [
        ParallaxImageData(
          'grass_right_side.png',
        ),
      ],
      position: Vector2(0, 0),
      alignment: Alignment.topRight,
      //Set velocity
      baseVelocity: Vector2(
        0,
        -100,
      ),
      repeat: ImageRepeat.repeatY,
    );
    world.add(rightGrassComponent);




  }
}
