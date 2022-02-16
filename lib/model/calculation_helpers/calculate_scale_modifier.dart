import 'dart:math';
import 'dart:ui';

double calculateScaleModifier(Size screenSize, double longestPlanetDistance) {
  double smallestScreenSideLength = min(screenSize.height, screenSize.width);
  return smallestScreenSideLength / (longestPlanetDistance * 2);
}
