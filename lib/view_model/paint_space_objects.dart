import 'package:flutter/material.dart';
import 'package:solar_system/model/space_object.dart';

class PaintSpaceObjects extends CustomPainter {
  PaintSpaceObjects(
      {required this.spaceObjects,
      required this.screenCenter,
      required this.scaleModifier});
  final List<SpaceObject> spaceObjects;
  final Offset screenCenter;
  final double scaleModifier;
  var paintUI = Paint();
  @override
  void paint(Canvas canvas, Size size) {
    for (SpaceObject spaceObject in spaceObjects) {
      paintUI.color = spaceObject.color;
      canvas.drawCircle(
          Offset(spaceObject.coordinates.x * scaleModifier + screenCenter.dx,
              spaceObject.coordinates.y * scaleModifier + screenCenter.dy),
          spaceObject.radius * scaleModifier,
          paintUI);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
