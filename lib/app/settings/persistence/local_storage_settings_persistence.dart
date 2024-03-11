import 'package:shared_preferences/shared_preferences.dart';

import 'settings_persistence.dart';

/// An implementation of [SettingsPersistence] that uses
/// `package:shared_preferences`.
class LocalStorageSettingsPersistence extends SettingsPersistence {
  final Future<SharedPreferences> instanceFuture =
      SharedPreferences.getInstance();

  @override
  Future<bool> getMuted({required bool defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getBool('mute') ?? defaultValue;
  }

  @override
  Future<void> saveMuted(bool value) async {
    final prefs = await instanceFuture;
    await prefs.setBool('mute', value);
  }

  @override
  Future<bool> getVibrationOn({required bool defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getBool('vibrationOn') ?? defaultValue;
  }

  @override
  Future<void> saveVibrationOn(bool value) async {
    final prefs = await instanceFuture;
    await prefs.setBool('vibrationOn', value);
  }

  @override
  Future<String> getLocale({required String defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getString('locale') ?? defaultValue;
  }

  @override
  Future<void> saveLocale(String value) async {
    final prefs = await instanceFuture;
    await prefs.setString('locale', value);
  }
}
