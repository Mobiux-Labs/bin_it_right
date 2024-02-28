import 'package:flutter/cupertino.dart';
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
    return Container(
      child: GestureDetector(
        child: Text('test'),
        onTap: () {
          final audioController = context.read<AudioController>();
          audioController.playSfx(SfxType.coin);
        },
      ),
    );
  }
}
