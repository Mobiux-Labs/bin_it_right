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
}
