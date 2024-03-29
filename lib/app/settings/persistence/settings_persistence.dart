/// An interface of persistence stores for settings.
///
/// Implementations can range from simple in-memory storage through
/// local preferences to cloud-based solutions.
abstract class SettingsPersistence {
  Future<bool> getMuted({required bool defaultValue});

  Future<void> saveMuted(bool value);

  Future<bool> getVibrationOn({required bool defaultValue});

  Future<void> saveVibrationOn(bool value);

  Future<String> getLocale({required String defaultValue});

  Future<void> saveLocale(String value);
}
