import 'dart:math';

import 'package:reseacue/constants/constants.dart';

int getRandomIntegrer(int max) {
  return Random().nextInt(max);
}

double getRandomDouble(num start, num end) {
  return Random().nextDouble() * (end - start) + start;
}

double getFromRange(
    input, inputMinimum, inputMaximum, outputMinimum, outputMaximum) {
  double slope =
      (outputMaximum - outputMinimum) / (inputMaximum - inputMinimum);
  return outputMinimum + slope * (input - inputMinimum);
}

double getBuildingSpawnRate(double gameSpeed) {
  double rate = getFromRange(
    gameSpeed,
    Constants.minimumGameSpeed,
    Constants.maximumGameSpeed,
    Constants.minimumBuildingSpawnRate,
    Constants.maximumBuildingSpawnRate,
  );
  if (rate <= 0.0) {
    return 0.1;
  }

  return rate;
}

double getVelocity(double gameSpeed) {
  double velocity = getFromRange(
    gameSpeed,
    Constants.minimumGameSpeed,
    Constants.maximumGameSpeed,
    Constants.minimumVelocity,
    Constants.maximumVelocity,
  );

  return velocity;
}
