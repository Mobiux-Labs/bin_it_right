import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/overlays/overlay_container.dart';

import '../game/game.dart';

class ButtonAndTextColumn extends StatelessWidget {
  final String image;
  final String text;

  const ButtonAndTextColumn({
    super.key,
    required this.image,
    required this.text,
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
          onTap: () {},
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

class SettingsMenu extends StatelessWidget {
  static final Logger _log = Logger('settings.dart');

  static const String id = 'Settings';
  const SettingsMenu({super.key, required this.game});

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

  @override
  Widget build(BuildContext context) {
    return OverlayContainer(
      game: game,
      id: id,
      heading: 'SETTINGS',
      height: MediaQuery.of(context).size.height / 1.8,
      width: MediaQuery.of(context).size.width / 1.15,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 35.0,
          right: 35.0,
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonAndTextColumn(
                  image: 'sound_on',
                  text: 'SFX',
                ),
                ButtonAndTextColumn(
                  image: 'vibration_on',
                  text: 'Vibration',
                ),
                ButtonAndTextColumn(
                  image: 'tutorial',
                  text: 'Tutorial',
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonAndTextColumn(
                  image: 'reset',
                  text: 'Reset',
                ),
                ButtonAndTextColumn(
                  image: 'credits',
                  text: 'Credits',
                ),
                ButtonAndTextColumn(
                  image: 'support',
                  text: 'Support',
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
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
