import 'dart:math';
import 'dart:ui';

import 'package:solar_system/model/coordinates.dart';
import 'package:solar_system/model/space_object.dart';

class Planet extends SpaceObject {
  Planet(
      {required double radius,
      required Color color,
      required this.speed,
      required this.distanceFromCenter,
      required this.angleInDegrees})
      : super(radius: radius, color: color);
  double speed;
  double distanceFromCenter;
  double angleInDegrees;

  @override
  Coordinates get coordinates {
    double angleInRadians = angleInDegrees * (pi / 180);
    double x = distanceFromCenter * cos(angleInRadians);
    double y = distanceFromCenter * sin(angleInRadians);
    return Coordinates(x: x, y: y);
  }

  @override
  set coordinates(Coordinates value) {
    throw Exception(
        'Do not set coordinates for a planet directly. Please specify distanceFromCenter and angleInDegrees instead');
  }
}
