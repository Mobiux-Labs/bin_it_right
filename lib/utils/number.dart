import 'dart:math';

import 'package:logging/logging.dart';
import 'package:reseacue/constants/constants.dart';

final Logger _log = Logger(Constants.utilsNumberLoggerKey);

int getRandomIntegrer(int max) {
  _log.info('Generating random integer');
  int randomInteger = Random().nextInt(max);
  _log.info('Generated random integer successfully');
  return randomInteger;
}

double getRandomDouble(num start, num end) {
  _log.info('Generating double integer');
  double randomDouble = Random().nextDouble() * (end - start) + start;
  _log.info('Generated random double successfully');
  return randomDouble;
}

double getFromRange(
    input, inputMinimum, inputMaximum, outputMinimum, outputMaximum) {
  _log.info(
      'Mapping range $inputMinimum -> $inputMaximum to $outputMinimum -> $outputMaximum');
  double slope =
      (outputMaximum - outputMinimum) / (inputMaximum - inputMinimum);
  double output = outputMinimum + slope * (input - inputMinimum);
  _log.info('Mapped range successfully');
  return output;
}

double getBuildingSpawnRate(double gameSpeed) {
  _log.info('Generating building spawn rate');
  double rate = getFromRange(
    gameSpeed,
    Constants.minimumGameSpeed,
    Constants.maximumGameSpeed,
    Constants.minimumBuildingSpawnRate,
    Constants.maximumBuildingSpawnRate,
  );
  _log.info('Generated building spawn rate successfully');
  if (rate <= 0.0) {
    _log.info('Returning minimum building spawn rate as the rate was 0.0');
    return 0.1;
  }

  return rate;
}

double getVelocity(double gameSpeed) {
  _log.info('Generating velocity');
  double velocity = getFromRange(
    gameSpeed,
    Constants.minimumGameSpeed,
    Constants.maximumGameSpeed,
    Constants.minimumVelocity,
    Constants.maximumVelocity,
  );

  _log.info('Generated velocity successfully');

  return velocity;
}
