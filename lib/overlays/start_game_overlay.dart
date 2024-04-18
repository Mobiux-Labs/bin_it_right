import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reseacue/app/audio/audio_controller.dart';
import 'package:reseacue/app/audio/sounds.dart';
import 'package:reseacue/app/storage/storage.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/app/ui/components/earth_tokens.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/overlays.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reseacue/overlays/upgrade_overlay.dart';
import 'package:reseacue/utils/images.dart';

import 'green_wins_gallery.dart';

class StartGameOverlay extends StatelessWidget {
  static String id = 'start_game_overlay';

  // Reference to parent game.
  final Reseacue game;

  const StartGameOverlay({super.key, required this.game});

  static const startButton = 'assets/images/start_button.png';
  static const settingsIcon = 'assets/images/settings.png';
  static const leaderboardIcon = 'assets/images/leaderboard.png';
  static const earthToken = 'assets/images/earth_tokens.png';

  @override
  Widget build(BuildContext context) {
    StorageController storageController = context.watch<StorageController>();

    return GradientOverlay(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                    valueListenable: storageController.score,
                    builder: (context, score, child) {
                      return EarthTokens(
                        earthPoints: score,
                      );
                    }),
                Row(
                  children: [
                    CustomAnimatedButton(
                      height: 50,
                      width: 50,
                      shadowHeight: 40,
                      shadowWidth: 50,
                      screenSize: MediaQuery.of(context).size,
                      onTap: () {
                        game.overlays.add(UpgradeOverlay.id);
                      },
                      imagePath: 'assets/images/upgrade.png',
                      shadowContainerColor:
                          Constants.yellowButtonShadowContainerColor,
                      containerColor: Constants.yellowButtonContainerColor,
                      shineColor: Constants.yellowButtonShineColor,
                      padding: const EdgeInsets.only(
                        left: 50,
                        top: 10.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomAnimatedButton(
                      height: 50,
                      width: 50,
                      shadowHeight: 40,
                      shadowWidth: 50,
                      screenSize: MediaQuery.of(context).size,
                      onTap: () {
                        GoRouter.of(context).push(Path.greenWinsGallery);
                      },
                      imagePath: getPathFromAssetString(AssetConstants.greenWinsGallery),
                      shadowContainerColor:
                      Constants.yellowButtonShadowContainerColor,
                      containerColor: Constants.yellowButtonContainerColor,
                      shineColor: Constants.yellowButtonShineColor,
                      padding: const EdgeInsets.only(
                        left: 50,
                        top: 10.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomAnimatedButton(
                      height: 50,
                      width: 50,
                      shadowHeight: 40,
                      shadowWidth: 50,
                      screenSize: MediaQuery.of(context).size,
                      onTap: () {
                        game.overlays.add(SettingsOverlay.id);
                      },
                      imagePath: 'assets/images/settings.png',
                      shadowContainerColor:
                          Constants.yellowButtonShadowContainerColor,
                      containerColor: Constants.yellowButtonContainerColor,
                      shineColor: Constants.yellowButtonShineColor,
                      padding: const EdgeInsets.only(
                        left: 50,
                        top: 10.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 80,
            ),
            child: CustomAnimatedButton(
              height: MediaQuery.of(context).size.height / 13,
              width: MediaQuery.of(context).size.width / 2.2,
              shadowHeight: MediaQuery.of(context).size.height / 15,
              shadowWidth: MediaQuery.of(context).size.width / 2.2,
              screenSize: MediaQuery.of(context).size,
              onTap: () {
                final audioController = context.read<AudioController>();
                audioController.playSfx(SfxType.engineStart);
                game.start();
                game.overlays.remove(StartGameOverlay.id);
                game.overlays.add(CountDownOverlay.id);
              },
              buttonText: AppLocalizations.of(context)!.start,
              shadowContainerColor: Constants.redButtonShadowContainerColor,
              containerColor: Constants.redButtonContainerColor,
              shineColor: Constants.redButtonShineColor,
              padding: const EdgeInsets.only(
                left: 50,
                top: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
