import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';

class Reseacue extends FlameGame with ScaleDetector {
  // Enable this if hitbox boundary has to be seen
  @override
  bool debugMode = false;

  late TiledComponent mapComponent;

  static const double minZoom = 0.4;
  static const double maxZoom = 5.0;

  // This variable will be used to calculate the difference between start zoom level and after scale gesture
  double startZoom = minZoom;

  @override
  Future<void> onLoad() async {
    camera.viewfinder
      // Set 0.4 as default zoom level as this zoom level covers the entire map
      ..zoom = startZoom
      // Set camera's anchor point to top left of the screen
      ..anchor = Anchor.topLeft;

    // Load the tile map
    mapComponent = await TiledComponent.load(
      // Make sure to add the map location in pubspec.yaml
      'map.tmx',
      // This is the size of the individual tile in the map, which is 16px
      Vector2.all(16),
    );

    // Adding the map component to the world so that the camera finds the map
    // ( Camera can see and relate to the objects available in the world )
    world.add(mapComponent);
  }

  @override
  void onScaleStart(info) {
    startZoom = camera.viewfinder.zoom;
  }

  @override
  void onScaleUpdate(ScaleUpdateInfo info) {
    final currentScale = info.scale.global;

    if (currentScale.isIdentity()) {
      processDrag(info);
      checkDragBorders();
    } else {
      processScale(info, currentScale);
      checkScaleBorders();
    }
  }

  void checkScaleBorders() {
    camera.viewfinder.zoom = camera.viewfinder.zoom.clamp(minZoom, maxZoom);
  }

  void checkDragBorders() {
    final worldRect = camera.visibleWorldRect;

    final currentPosition = camera.viewfinder.position;

    final mapSize = Offset(mapComponent.width, mapComponent.height);

    var xTranslate = 0.0;
    var yTranslate = 0.0;

    if (worldRect.topLeft.dx < 0.0) {
      xTranslate = -worldRect.topLeft.dx;
    } else if (worldRect.bottomRight.dx > mapSize.dx) {
      xTranslate = mapSize.dx - worldRect.bottomRight.dx;
    }

    if (worldRect.topLeft.dy < 0.0) {
      yTranslate = -worldRect.topLeft.dy;
    } else if (worldRect.bottomRight.dy > mapSize.dy) {
      yTranslate = mapSize.dy - worldRect.bottomRight.dy;
    }

    camera.viewfinder.position =
        currentPosition.translated(xTranslate, yTranslate);
  }

  void processDrag(ScaleUpdateInfo info) {
    final delta = info.delta.global;
    final zoomDragFactor = 1.0 / startZoom;
    final currentPosition = camera.viewfinder.position;

    camera.viewfinder.position = currentPosition.translated(
      -delta.x * zoomDragFactor,
      -delta.y * zoomDragFactor,
    );
  }

  void processScale(ScaleUpdateInfo info, Vector2 currentScale) {
    final newZoom = startZoom * ((currentScale.y + currentScale.x) / 2.0);
    camera.viewfinder.zoom = newZoom.clamp(minZoom, maxZoom);
  }
}
