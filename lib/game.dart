import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/layers.dart' as layers;
import 'package:flame_tiled/flame_tiled.dart';

class GameLayer extends layers.DynamicLayer {
  final Sprite playerSprite;
  final Sprite playerSprite2;

  GameLayer(this.playerSprite, this.playerSprite2) {
    preProcessors.add(layers.ShadowProcessor());
  }

  @override
  void drawLayer() {
    playerSprite.render(
      canvas,
      position: Vector2.all(50),
      size: Vector2.all(50),
    );
    playerSprite2.render(
      canvas,
      position: Vector2.all(100),
      size: Vector2.all(50),
    );
  }
}

class Reseacue extends FlameGame with ScaleDetector {
  late TiledComponent mapComponent;
  late layers.Layer gameLayer;

  @override
  Future<void> onLoad() async {
    camera.viewfinder
      // Set 0.4 as default zoom level as this zoom level covers the entire map
      ..zoom = 0.4
      // Set camera's anchor point to top left of the screen
      ..anchor = Anchor.topLeft;

    // Load the tile map
    mapComponent = await TiledComponent.load(
      // Make sure to add the map location in pubspec.yaml
      'map.tmx',
      // This is the size of the indivudual tile in the map, which is 16px
      Vector2.all(16),
    );

    // Adding the map component to the world so that the camera finds the map
    // ( Camera can see and relate to the objects available in the world )
    world.add(mapComponent);

    final playerSprite = Sprite(await images.load('player.png'));
    final playerSprite2 = Sprite(await images.load('player.png'));

    gameLayer = GameLayer(playerSprite, playerSprite2) as layers.Layer;
  }

  void clampZoom() {
    // Clamp the minimum and maximum zoom levels
    camera.viewfinder.zoom = camera.viewfinder.zoom.clamp(0.4, 5.0);
  }

  late double startZoom;

  @override
  void onScaleStart(info) {
    print(info.eventPosition.global);
    startZoom = camera.viewfinder.zoom;
  }

  @override
  void onScaleUpdate(ScaleUpdateInfo info) {
    final currentScale = info.scale.global;

    // Check if gesture is zoom or pan
    if (!currentScale.isIdentity()) {
      camera.viewfinder.zoom = startZoom * currentScale.y;
      clampZoom();
    } else {
      final delta = info.delta.global;

      // Normalizing the delta by dividing the pan change with zoom level
      camera.viewfinder.position -= (delta / camera.viewfinder.zoom);
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    gameLayer.render(canvas);
  }
}
