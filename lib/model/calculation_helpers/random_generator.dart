import 'dart:math';

double randomGenerator(double minValue, double maxValue, int precision) {
  final random = Random();
  final doubleRandom = minValue + (maxValue - minValue) * random.nextDouble();
  return double.parse(doubleRandom.toStringAsFixed(precision));
}
