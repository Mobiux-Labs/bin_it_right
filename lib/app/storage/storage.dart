import 'package:flutter/foundation.dart';
import 'package:reseacue/constants/constants.dart';

import 'persistence/storage_persistence.dart';

class StorageController {
  final StoragePersistence _persistence;

  ValueNotifier<int> score = ValueNotifier(0);
  ValueNotifier<int> highscore = ValueNotifier(0);
  ValueNotifier<bool> tutorialWatched = ValueNotifier(false);

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
    ]);
  }

  void updateScore() {
    score.value += Constants.tokensPerWaste;
    _persistence.saveScore(score.value);
    if (score.value > highscore.value) {
      _persistence.saveHighScore(score.value);
    }
  }

  void watchedTutorial() {
    tutorialWatched.value = true;
    _persistence.saveTutorialWatched(tutorialWatched.value);
  }

  void resetTutorial() {
    tutorialWatched.value = false;
    _persistence.saveTutorialWatched(tutorialWatched.value);
  }
}
