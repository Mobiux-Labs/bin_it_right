import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/game/gift_sequence.dart';
import 'package:reseacue/overlays/gift_collect_overlay.dart';
import 'package:reseacue/overlays/gift_open_overlay.dart';
import 'package:reseacue/overlays/settings_overlay.dart';

class GiftOpeningOverlay extends StatelessWidget {
  static String id = 'gift_opening_overlay';

  final Reseacue mainGame;

  const GiftOpeningOverlay({
    super.key,
    required this.mainGame,
  });

  @override
  Widget build(BuildContext context) {
    return GameWidget<GiftSequence>.controlled(
      gameFactory: () =>
          GiftSequence(gifts: mainGame.giftsCollectedOrder, mainGame: mainGame),
      overlayBuilderMap: {
        SettingsOverlay.id: (_, game) => SettingsOverlay(game: mainGame),
        GiftOpenOverlay.id: (_, game) =>
            GiftOpenOverlay(mainGame: mainGame, game: game),
        GiftCollectOverlay.id: (_, game) =>
            GiftCollectOverlay(game: game, mainGame: mainGame),
      },
      initialActiveOverlays: const [GiftOpenOverlay.id],
    );
  }
}
