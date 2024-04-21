import 'package:flutter/foundation.dart';

import 'persistence/storage_persistence.dart';

class StorageController {
  final StoragePersistence _persistence;

  ValueNotifier<int> score = ValueNotifier(0);
  ValueNotifier<int> highscore = ValueNotifier(0);
  ValueNotifier<bool> tutorialWatched = ValueNotifier(false);
  ValueNotifier<int> vehicleSkin = ValueNotifier(1);
  ValueNotifier<double> magnetPowerDuration = ValueNotifier(5.0);

  ValueNotifier<bool> isBoltLocked = ValueNotifier(true);
  ValueNotifier<bool> isBatteryLocked = ValueNotifier(true);
  ValueNotifier<bool> isCanLocked = ValueNotifier(true);
  ValueNotifier<bool> isBulbLocked = ValueNotifier(true);
  ValueNotifier<bool> isBottleLocked = ValueNotifier(true);
  ValueNotifier<bool> isPhoneLocked = ValueNotifier(true);

  /// Creates a new instance of [StorageController] backed by [persistence].
  StorageController({required StoragePersistence persistence})
      : _persistence = persistence;

  /// Asynchronously loads values from the injected persistence store.
  Future<void> loadStateFromPersistence() async {
    await Future.wait([
      _persistence
          .getScore(defaultValue: 0)
          .then((value) => score.value = value),
      _persistence
          .getHighScore(defaultValue: 0)
          .then((value) => highscore.value = value),
      _persistence
          .getTutorialWatched(defaultValue: false)
          .then((value) => tutorialWatched.value = value),
      _persistence
          .getVehicleSkin(defaultValue: 1)
          .then((value) => vehicleSkin.value = value),
      _persistence
          .getMagnetPowerDuration(defaultValue: 5.0)
          .then((value) => magnetPowerDuration.value = value),
      _persistence
          .getBoltLockedState(defaultValue: true)
          .then((value) => isBoltLocked.value = value),
      _persistence
          .getBatteryLockedState(defaultValue: true)
          .then((value) => isBatteryLocked.value = value),
      _persistence
          .getCanLockedState(defaultValue: true)
          .then((value) => isCanLocked.value = value),
      _persistence
          .getBulbLockedState(defaultValue: true)
          .then((value) => isBulbLocked.value = value),
      _persistence
          .getBottleLockedState(defaultValue: true)
          .then((value) => isBottleLocked.value = value),
      _persistence
          .getPhoneLockedState(defaultValue: true)
          .then((value) => isPhoneLocked.value = value),
    ]);
  }

  void upgradeMagnetPowerDuration(double duration) {
    magnetPowerDuration.value = duration;
    _persistence.saveMagnetPowerDuration(magnetPowerDuration.value);
  }

  void updateVehicleSkin(int skin) {
    vehicleSkin.value = skin;
    _persistence.saveVehicleSkin(vehicleSkin.value);
  }

  void reduceScore(int scoreToUpdate) {
    score.value -= scoreToUpdate;
    _persistence.saveScore(score.value);
  }

  void updateScore(int scoreToUpdate) {
    if (score.value > highscore.value) {
      highscore.value = score.value;
      _persistence.saveHighScore(highscore.value);
    }
    score.value += scoreToUpdate;
    _persistence.saveScore(score.value);
  }

  void updateScoreForGreenWins(int scoreToUpdate) {
    score.value += scoreToUpdate;
    _persistence.saveScore(score.value);
  }

  void watchedTutorial() {
    tutorialWatched.value = true;
    _persistence.saveTutorialWatched(tutorialWatched.value);
  }

  void resetTutorial() {
    tutorialWatched.value = false;
    _persistence.saveTutorialWatched(tutorialWatched.value);
  }

  void unlockBolt() {
    isBoltLocked.value = false;
    _persistence.unlockBolt(isBoltLocked.value);
  }

  void unlockBattery() {
    isBatteryLocked.value = false;
    _persistence.unlockBattery(isBoltLocked.value);
  }

  void unlockCan() {
    isCanLocked.value = false;
    _persistence.unlockCan(isBoltLocked.value);
  }

  void unlockBulb() {
    isBulbLocked.value = false;
    _persistence.unlockBulb(isBoltLocked.value);
  }

  void unlockBottle() {
    isBottleLocked.value = false;
    _persistence.unlockBottle(isBoltLocked.value);
  }

  void unlockPhone() {
    isPhoneLocked.value = false;
    _persistence.unlockPhone(isBoltLocked.value);
  }
}
