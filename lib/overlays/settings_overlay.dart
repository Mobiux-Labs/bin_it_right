import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:reseacue/app/settings/settings.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/overlays/overlays.dart';
import 'package:url_launcher/url_launcher.dart';

import '../game/game.dart';

class ButtonAndTextColumn extends StatelessWidget {
  final String image;
  final String text;
  final Function onTap;

  const ButtonAndTextColumn({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAnimatedButton(
          height: MediaQuery.of(context).size.height / 11,
          width: MediaQuery.of(context).size.width / 5,
          shadowHeight: MediaQuery.of(context).size.height / 13,
          shadowWidth: MediaQuery.of(context).size.width / 5,
          screenSize: MediaQuery.of(context).size,
          onTap: () {
            onTap();
          },
          imagePath: 'assets/images/$image.png',
          shadowContainerColor: Constants.redButtonShadowContainerColor,
          containerColor: Constants.redButtonContainerColor,
          shineColor: Constants.redButtonShineColor,
          padding: const EdgeInsets.only(
            left: 67.0,
            top: 10.0,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'Digitalt',
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}

class SettingsOverlay extends StatelessWidget {
  static const String id = 'settings_overlay';

  static final Logger _log = Logger('settings.dart');

  const SettingsOverlay({super.key, required this.game});

  final Reseacue game;

  Future<String> getAppVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String installedAppVersion = packageInfo.version;
      return 'Ver $installedAppVersion';
    } catch (e) {
      _log.warning(e);
    }

    return 'Ver 1.0.0';
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(Constants.mobiuxUrl);
    if (!await launchUrl(url)) {
      _log.warning('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsController = context.watch<SettingsController>();

    return OverlayContainer(
      game: game,
      id: id,
      heading: 'SETTINGS',
      height: MediaQuery.of(context).size.height / 1.8,
      width: MediaQuery.of(context).size.width / 1.15,
      onClose: () {},
      child: Padding(
        padding: const EdgeInsets.only(
          left: 35.0,
          right: 35.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ValueListenableBuilder(
                    valueListenable: settingsController.muted,
                    builder: (context, muted, child) {
                      return ButtonAndTextColumn(
                        image: muted ? 'sound_off' : 'sound_on',
                        text: 'SFX',
                        onTap: () {
                          settingsController.toggleMuted();
                        },
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: settingsController.vibrationOn,
                    builder: (context, vibrationOn, child) {
                      return ButtonAndTextColumn(
                        image: vibrationOn ? 'vibration_on' : 'vibration_off',
                        text: 'Vibration',
                        onTap: () {
                          settingsController.toggleVibration();
                        },
                      );
                    }),
                ButtonAndTextColumn(
                  image: 'tutorial',
                  text: 'Tutorial',
                  onTap: () {
                    game.overlays.add(TutorialOverlay.id);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonAndTextColumn(
                  image: 'reset',
                  text: 'Reset',
                  onTap: () {},
                ),
                ButtonAndTextColumn(
                  image: 'english',
                  text: 'ENGLISH',
                  onTap: () {},
                ),
                ButtonAndTextColumn(
                  image: 'support',
                  text: 'Support',
                  onTap: () {
                    _launchUrl();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              'DEVELOPED BY - MOBIUX LABS',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Digitalt',
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
                future: getAppVersion(),
                initialData: null,
                builder: (context, AsyncSnapshot<String?> snapshot) {
                  if (!snapshot.hasData) {
                    return const Text(
                      'Ver 1.0.0',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Digitalt',
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20.0,
                    ),
                    child: Text(
                      snapshot.data as String,
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Digitalt',
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
