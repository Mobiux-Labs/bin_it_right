import 'package:flutter/foundation.dart';

import 'persistence/settings_persistence.dart';

/// An class that holds settings,
/// and saves them to an injected persistence store.
class SettingsController {
  final SettingsPersistence _persistence;

  /// Whether or not the sound is on at all. This overrides both music
  /// and sound.
  ValueNotifier<bool> muted = ValueNotifier(false);
  ValueNotifier<bool> vibrationOn = ValueNotifier(true);
  ValueNotifier<String> locale = ValueNotifier('en');

  /// Creates a new instance of [SettingsController] backed by [persistence].
  SettingsController({required SettingsPersistence persistence})
      : _persistence = persistence;

  /// Asynchronously loads values from the injected persistence store.
  Future<void> loadStateFromPersistence() async {
    await Future.wait([
      _persistence
          // On the web, sound can only start after user interaction, so
          // we start muted there.
          // On any other platform, we start unmuted.
          .getMuted(defaultValue: kIsWeb)
          .then((value) => muted.value = value),
      _persistence
          .getVibrationOn(defaultValue: true)
          .then((value) => vibrationOn.value = value),
      _persistence
          .getLocale(defaultValue: 'en')
          .then((value) => locale.value = value),
    ]);
  }

  void toggleMuted() {
    muted.value = !muted.value;
    _persistence.saveMuted(muted.value);
  }

  void toggleVibration() {
    vibrationOn.value = !vibrationOn.value;
    _persistence.saveVibrationOn(vibrationOn.value);
  }

  void reset() {
    muted.value = false;
    _persistence.saveMuted(muted.value);
    vibrationOn.value = true;
    _persistence.saveVibrationOn(vibrationOn.value);
  }

  void changeLocale(String localeToUpdate) {
    locale.value = localeToUpdate;
    _persistence.saveLocale(locale.value);
  }
}
