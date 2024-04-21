import 'package:shared_preferences/shared_preferences.dart';

import 'storage_persistence.dart';

/// An implementation of [StoragePersistence] that uses
/// `package:shared_preferences`.
class LocalStorageStoragePersistence extends StoragePersistence {
  final Future<SharedPreferences> instanceFuture =
      SharedPreferences.getInstance();

  @override
  Future<int> getScore({required int defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getInt('score') ?? defaultValue;
  }

  @override
  Future<void> saveScore(int value) async {
    final prefs = await instanceFuture;
    await prefs.setInt('score', value);
  }

  @override
  Future<int> getHighScore({required int defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getInt('highscore') ?? defaultValue;
  }

  @override
  Future<void> saveHighScore(int value) async {
    final prefs = await instanceFuture;
    await prefs.setInt('highscore', value);
  }

  @override
  Future<bool> getTutorialWatched({required bool defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getBool('tutorial') ?? defaultValue;
  }

  @override
  Future<void> saveTutorialWatched(bool value) async {
    final prefs = await instanceFuture;
    await prefs.setBool('tutorial', value);
  }

  @override
  Future<int> getVehicleSkin({required int defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getInt('vehicleSkin') ?? defaultValue;
  }

  @override
  Future<void> saveVehicleSkin(int value) async {
    final prefs = await instanceFuture;
    await prefs.setInt('vehicleSkin', value);
  }

  @override
  Future<double> getMagnetPowerDuration({required double defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getDouble('magnetPowerDuration') ?? defaultValue;
  }

  @override
  Future<void> saveMagnetPowerDuration(double value) async {
    final prefs = await instanceFuture;
    await prefs.setDouble('magnetPowerDuration', value);
  }

  @override
  Future<bool> getBoltLockedState({required bool defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getBool('isBoltLocked') ?? defaultValue;
  }

  @override
  Future<void> unlockBolt(bool value) async {
    final prefs = await instanceFuture;
    await prefs.setBool('isBoltLocked', value);
  }

  @override
  Future<bool> getBatteryLockedState({required bool defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getBool('isBatteryLocked') ?? defaultValue;
  }

  @override
  Future<void> unlockBattery(bool value) async {
    final prefs = await instanceFuture;
    await prefs.setBool('isBatteryLocked', value);
  }

  @override
  Future<bool> getCanLockedState({required bool defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getBool('isCanLocked') ?? defaultValue;
  }

  @override
  Future<void> unlockCan(bool value) async {
    final prefs = await instanceFuture;
    await prefs.setBool('isCanLocked', value);
  }

  @override
  Future<bool> getBulbLockedState({required bool defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getBool('isBulbLocked') ?? defaultValue;
  }

  @override
  Future<void> unlockBulb(bool value) async {
    final prefs = await instanceFuture;
    await prefs.setBool('isBulbLocked', value);
  }

  @override
  Future<bool> getBottleLockedState({required bool defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getBool('isBottleLocked') ?? defaultValue;
  }

  @override
  Future<void> unlockBottle(bool value) async {
    final prefs = await instanceFuture;
    await prefs.setBool('isBottleLocked', value);
  }

  @override
  Future<bool> getPhoneLockedState({required bool defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getBool('isPhoneLocked') ?? defaultValue;
  }

  @override
  Future<void> unlockPhone(bool value) async {
    final prefs = await instanceFuture;
    await prefs.setBool('isPhoneLocked', value);
  }
}
