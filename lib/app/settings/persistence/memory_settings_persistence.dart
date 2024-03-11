import 'settings_persistence.dart';

/// An in-memory implementation of [SettingsPersistence].
/// Useful for testing.
class MemoryOnlySettingsPersistence implements SettingsPersistence {
  bool musicOn = true;

  bool soundsOn = true;

  bool muted = false;

  @override
  Future<bool> getMuted({required bool defaultValue}) async => muted;

  @override
  Future<void> saveMuted(bool value) async => muted = value;
}
