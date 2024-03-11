abstract class StoragePersistence {
  Future<int> getScore({required int defaultValue});

  Future<void> saveScore(int value);

  Future<int> getHighScore({required int defaultValue});

  Future<void> saveHighScore(int value);

  Future<bool> getTutorialWatched({required bool defaultValue});

  Future<void> saveTutorialWatched(bool value);
}
