import 'storage_persistence.dart';

/// An in-memory implementation of [StoragePersistence].
/// Useful for testing.
class MemoryOnlyStoragePersistence implements StoragePersistence {
  int score = 0;
  int highscore = 0;
  bool tutorialWatched = false;
  int vehicleSkin = 1;
  double magnetPowerDuration = 5.0;

  bool isBoltLocked = true;
  bool isBatteryLocked = true;
  bool isCanLocked = true;
  bool isBulbLocked = true;
  bool isBottleLocked = true;
  bool isPhoneLocked = true;

  @override
  Future<int> getScore({required int defaultValue}) async => score;

  @override
  Future<void> saveScore(int value) async => score = value;

  @override
  Future<int> getHighScore({required int defaultValue}) async => highscore;

  @override
  Future<void> saveHighScore(int value) async => highscore = value;

  @override
  Future<bool> getTutorialWatched({required bool defaultValue}) async =>
      tutorialWatched;

  @override
  Future<void> saveTutorialWatched(bool value) async => tutorialWatched = value;

  @override
  Future<int> getVehicleSkin({required int defaultValue}) async => vehicleSkin;

  @override
  Future<void> saveVehicleSkin(int value) async => vehicleSkin = value;

  @override
  Future<double> getMagnetPowerDuration({required double defaultValue}) async =>
      magnetPowerDuration;

  @override
  Future<void> saveMagnetPowerDuration(double value) async =>
      magnetPowerDuration = value;

  @override
  Future<bool> getBoltLockedState({required bool defaultValue}) async =>
      isBoltLocked;

  @override
  Future<void> unlockBolt(bool value) async => isBoltLocked = value;

  @override
  Future<bool> getBatteryLockedState({required bool defaultValue}) async =>
      isBatteryLocked;

  @override
  Future<void> unlockBattery(bool value) async => isBatteryLocked = value;

  @override
  Future<bool> getCanLockedState({required bool defaultValue}) async =>
      isCanLocked;

  @override
  Future<void> unlockCan(bool value) async => isCanLocked = value;

  @override
  Future<bool> getBulbLockedState({required bool defaultValue}) async =>
      isBulbLocked;

  @override
  Future<void> unlockBulb(bool value) async => isBulbLocked = value;

  @override
  Future<bool> getBottleLockedState({required bool defaultValue}) async =>
      isBottleLocked;

  @override
  Future<void> unlockBottle(bool value) async => isBottleLocked = value;

  @override
  Future<bool> getPhoneLockedState({required bool defaultValue}) async =>
      isPhoneLocked;

  @override
  Future<void> unlockPhone(bool value) async => isPhoneLocked = value;
}
