import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reseacue/app/audio/audio_controller.dart';
import 'package:reseacue/app/audio/sounds.dart';
import 'package:reseacue/app/storage/storage.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/app/ui/components/score_card.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/overlays.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reseacue/utils/utils.dart';

class GameOverOverlay extends StatelessWidget {
  static String id = 'game_over_overlay';
  const GameOverOverlay({super.key, required this.game});

  final Reseacue game;

  final double containerWidth = 60;
  final double containerHeight = 60;
  final double shadowContainerHeight = 50;

  @override
  Widget build(BuildContext context) {
    StorageController storageController = context.watch<StorageController>();
    AudioController audioController = context.watch<AudioController>();

    if (game.score.value > storageController.highscore.value) {
      audioController.playSfx(SfxType.highScore);
    }

    return OverlayContainer(
      game: game,
      id: id,
      heading: truncateText(AppLocalizations.of(context)!.binBoss, 10),
      height: MediaQuery.of(context).size.height / 1.8,
      width: MediaQuery.of(context).size.width / 1.15,
      onClose: () {},
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 30.0,
        ),
        child: Column(
          children: [
            ScoreCard(
              imagePath: 'assets/images/earth_token.png',
              score: game.score.value.toString(),
              label: AppLocalizations.of(context)!.score,
            ),
            const SizedBox(
              height: 30.0,
            ),
            ScoreCard(
              imagePath: 'assets/images/earth_token.png',
              score: game.score.value > storageController.highscore.value
                  ? game.score.value.toString()
                  : storageController.highscore.value.toString(),
              fontSize: 40,
              imageSize: 30,
              label: AppLocalizations.of(context)!.best,
              labelFontSize: 20,
              yOffset: 10,
              heightFactor: 11,
              padding: 10,
            ),
            const SizedBox(
              height: 60.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomAnimatedButton(
                  height: containerHeight,
                  width: MediaQuery.of(context).size.width / 1.7,
                  shadowHeight: shadowContainerHeight,
                  shadowWidth: MediaQuery.of(context).size.width / 1.7,
                  screenSize: MediaQuery.of(context).size,
                  onTap: () {
                    storageController.updateScore(game.score.value);
                    game.restart();
                    game.overlays.remove(id);
                    game.overlays.remove(GamePlayOverlay.id);
                    game.overlays.add(StartGameOverlay.id);
                  },
                  buttonText: AppLocalizations.of(context)!.continueString,
                  shadowContainerColor: Constants.redButtonShadowContainerColor,
                  containerColor: Constants.redButtonContainerColor,
                  shineColor: Constants.redButtonShineColor,
                  padding: const EdgeInsets.only(
                    left: 67.0,
                    top: 10.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
