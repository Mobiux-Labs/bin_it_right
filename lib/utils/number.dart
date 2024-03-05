import 'dart:math';

int getRandomIntegrer(int max) {
  return Random().nextInt(max);
}

double getRandomDouble(num start, num end) {
  return Random().nextDouble() * (end - start) + start;
}
