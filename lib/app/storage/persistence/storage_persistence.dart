abstract class StoragePersistence {
  Future<int> getScore({required int defaultValue});

  Future<void> saveScore(int value);

  Future<int> getHighScore({required int defaultValue});

  Future<void> saveHighScore(int value);

  Future<bool> getTutorialWatched({required bool defaultValue});

  Future<void> saveTutorialWatched(bool value);

  Future<int> getVehicleSkin({required int defaultValue});

  Future<void> saveVehicleSkin(int value);

  Future<double> getMagnetPowerDuration({required double defaultValue});

  Future<void> saveMagnetPowerDuration(double value);

  Future<bool> getBoltLockedState({required bool defaultValue});

  Future<void> unlockBolt(bool value);

  Future<bool> getBatteryLockedState({required bool defaultValue});

  Future<void> unlockBattery(bool value);

  Future<bool> getCanLockedState({required bool defaultValue});

  Future<void> unlockCan(bool value);

  Future<bool> getBulbLockedState({required bool defaultValue});

  Future<void> unlockBulb(bool value);

  Future<bool> getBottleLockedState({required bool defaultValue});

  Future<void> unlockBottle(bool value);

  Future<bool> getPhoneLockedState({required bool defaultValue});

  Future<void> unlockPhone(bool value);
}
