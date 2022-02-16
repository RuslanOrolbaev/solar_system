import 'package:flutter/material.dart';
import 'package:solar_system/model/coordinates.dart';

class SpaceObject {
  SpaceObject({required this.radius, required this.color});
  Coordinates _coordinates = Coordinates(x: 0, y: 0);

  Coordinates get coordinates => _coordinates;

  set coordinates(Coordinates value) {
    _coordinates = value;
  }

  Color color;
  double radius;
}
