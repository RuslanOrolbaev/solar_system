import 'package:flutter/material.dart';
import 'package:solar_system/model/space_object.dart';

class PaintSpaceObject extends CustomPainter {
  PaintSpaceObject(
      {required this.spaceObject,
      required this.screenCenter,
      required this.scaleModifier,
      this.shallRebuildWithSetState = true});
  final SpaceObject spaceObject;
  final Offset screenCenter;
  final double scaleModifier;
  final bool shallRebuildWithSetState;
  Paint paintUI = Paint();
  @override
  void paint(Canvas canvas, Size size) {
    paintUI.color = spaceObject.color;
    canvas.drawCircle(
        Offset(spaceObject.coordinates.x * scaleModifier + screenCenter.dx,
            spaceObject.coordinates.y * scaleModifier + screenCenter.dy),
        spaceObject.radius * scaleModifier,
        paintUI);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return shallRebuildWithSetState;
  }
}
