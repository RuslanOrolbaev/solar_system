import 'package:flutter/material.dart';
import 'package:solar_system/model/space_object.dart';
import 'package:solar_system/view_model/paint_space_object.dart';

class SpaceObjectWidget extends StatelessWidget {
  const SpaceObjectWidget(
      {required this.spaceObject,
      this.scaleModifier,
      this.screenCenter,
      Key? key})
      : super(key: key);
  final SpaceObject spaceObject;
  final Offset? screenCenter;
  final double? scaleModifier;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: PaintSpaceObject(
            spaceObject: spaceObject,
            screenCenter: screenCenter ?? const Offset(0, 0),
            scaleModifier: scaleModifier ?? 1));
  }
}
