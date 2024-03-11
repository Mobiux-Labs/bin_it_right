import 'storage_persistence.dart';

/// An in-memory implementation of [StoragePersistence].
/// Useful for testing.
class MemoryOnlyStoragePersistence implements StoragePersistence {
  int score = 0;
  int highscore = 0;

  @override
  Future<int> getScore({required int defaultValue}) async => score;

  @override
  Future<void> saveScore(int value) async => score = value;

  @override
  Future<int> getHighScore({required int defaultValue}) async => highscore;

  @override
  Future<void> saveHighScore(int value) async => highscore = value;
}
