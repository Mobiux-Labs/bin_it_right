import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:reseacue/app/audio/audio_controller.dart';
import 'package:reseacue/app/audio/sounds.dart';
import 'package:reseacue/constants/constants.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});
  static final Logger _log = Logger(Constants.mainMenuLoggerKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: const Text('test'),
        onTap: () {
          _log.info('Initiating sound from main menu');
          final audioController = context.read<AudioController>();
          audioController.playSfx(SfxType.coin);
        },
      ),
    );
  }
}
