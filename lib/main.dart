import 'dart:developer';

import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/app/app.dart';
import 'package:reseacue/app/settings/persistence/local_storage_settings_persistence.dart';
import 'package:reseacue/constants/constants.dart';

Logger _log = Logger(Constants.mainLoggerKey);

void main() {
  // Subscribe to log messages.
  // Logger.root.onRecord.listen((record) {
  //   log(
  //     record.message,
  //     time: record.time,
  //     level: record.level.value,
  //     name: record.loggerName,
  //     zone: record.zone,
  //     error: record.error,
  //     stackTrace: record.stackTrace,
  //   );
  // });

  // This is to make sure everything is loaded and initialized before use
  WidgetsFlutterBinding.ensureInitialized();

  _log.info('Going full screen');
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  _log.info('Went full screen successfully');

  _log.info('Setting portrait only');
  Flame.device.setPortraitUpOnly();
  _log.info('Setting portrait only successfully');

  runApp(
    App(
      settingsPersistence: LocalStorageSettingsPersistence(),
    ),
  );
}
