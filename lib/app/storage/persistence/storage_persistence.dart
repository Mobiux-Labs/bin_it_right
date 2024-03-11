abstract class StoragePersistence {
  Future<int> getScore({required int defaultValue});

  Future<void> saveScore(int value);

  Future<int> getHighScore({required int defaultValue});

  Future<void> saveHighScore(int value);
}
