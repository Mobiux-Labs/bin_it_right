import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reseacue/widgets/overlays/pause_button.dart';
import 'package:reseacue/widgets/overlays/pause_menu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Flame.device.fullScreen();
  runApp(
    GameWidget(
      game: TrashTrek(),
      initialActiveOverlays: const [PauseButton.ID],
      overlayBuilderMap: {
        PauseButton.ID: (BuildContext context, TrashTrek gameRef) =>
            PauseButton(
              gameRef: gameRef,
            ),
        PauseMenu.ID: (BuildContext context, TrashTrek gameRef) =>
            PauseMenu(
              gameRef: gameRef,
            ),
      },
    ),
  );
}

class TrashTrek extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFFE7DFC1);

  final Vector2 baseVelocity = Vector2(
    0,
    -100,
  );

  @override
  void onLoad() async {
    super.onLoad();
    //Load images to Flame image object
    await Flame.images.loadAll([
      'road_background.png',
      'grass_left_side.png',
      'grass_right_side.png',
      'auto.png'
    ]);

    camera.viewfinder.anchor = Anchor.topLeft;

    final roadImage = Flame.images.fromCache('road_background.png');

    Sprite road = Sprite(roadImage);
    SpriteComponent roadComponent = SpriteComponent(
      sprite: road,
      anchor: Anchor.topCenter,
      position: Vector2(size.x / 2, 0),
      //road is rendered to center of the screen
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
      baseVelocity: baseVelocity,
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
      baseVelocity: baseVelocity,
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
      baseVelocity: baseVelocity,
      repeat: ImageRepeat.repeatY,
    );
    world.add(rightGrassComponent);

    final autoImage = Flame.images.fromCache('auto.png');

    Sprite auto = Sprite(autoImage);
    SpriteComponent autoComponent = SpriteComponent(
      sprite: auto,
      anchor: Anchor.bottomCenter,
      position: Vector2(
        size.x / 2,
        size.y,
      ),
    );

    world.add(autoComponent);
  }
}
