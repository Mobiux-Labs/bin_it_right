import 'settings_persistence.dart';

/// An in-memory implementation of [SettingsPersistence].
/// Useful for testing.
class MemoryOnlySettingsPersistence implements SettingsPersistence {
  bool muted = false;

  bool vibrationOn = true;

  String locale = 'en';

  @override
  Future<bool> getMuted({required bool defaultValue}) async => muted;

  @override
  Future<void> saveMuted(bool value) async => muted = value;

  @override
  Future<bool> getVibrationOn({required bool defaultValue}) async =>
      vibrationOn;

  @override
  Future<void> saveVibrationOn(bool value) async => vibrationOn = value;

  @override
  Future<String> getLocale({required String defaultValue}) async => locale;

  @override
  Future<void> saveLocale(String value) async => locale = value;
}
