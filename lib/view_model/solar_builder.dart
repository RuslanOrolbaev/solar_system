import 'dart:async';
import 'package:flutter/material.dart';
import 'package:solar_system/model/calculation_helpers/calculate_scale_modifier.dart';
import 'package:solar_system/model/calculation_helpers/farest_planet_distance.dart';
import 'package:solar_system/model/space_object.dart';
import 'package:solar_system/view_model/paint_space_object.dart';

import '../configuration.dart';
import '../model/planet.dart';
import 'package:logging/logging.dart';

Logger _logger = Logger('SolarBuilder');

class SolarBuilder extends StatefulWidget {
  const SolarBuilder(
      {required this.planets,
      required this.screenSize,
      this.animationRunning = true,
      Key? key})
      : super(key: key);
  final List<Planet> planets;
  final Size screenSize;
  final bool animationRunning;

  @override
  _SolarBuilderState createState() => _SolarBuilderState();
}

class _SolarBuilderState extends State<SolarBuilder> {
  late Offset _screenCenter;
  late double _scaleModifier;
  late double _longestDistance;
  late Timer _timer;
  late SpaceObject _sun;

  @override
  void initState() {
    _logger.info('running initState');
    _screenCenter =
        Offset(widget.screenSize.width / 2, widget.screenSize.height / 2);
    _longestDistance = longestPlanetDistance(widget.planets);
    _scaleModifier =
        calculateScaleModifier(widget.screenSize, _longestDistance);
    _timer = Timer.periodic(
        const Duration(microseconds: frameRenewalTimeInMicroseconds),
        drawFrame);
    _sun = SpaceObject(radius: 100, color: Colors.yellow);
    super.initState();
  }

  @override
  void dispose() {
    _logger.info('running dispose');
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> planetWidgets = [];
    planetWidgets.add(CustomPaint(
        painter: PaintSpaceObject(
            spaceObject: _sun,
            screenCenter: _screenCenter,
            scaleModifier: _scaleModifier,

            ///setting ShallRebuildWithSetState to false excludes Sun from rebuilding with each setState to optimize performance
            shallRebuildWithSetState: false)));
    for (Planet planet in widget.planets) {
      planetWidgets.add(CustomPaint(
          painter: PaintSpaceObject(
        spaceObject: planet,
        screenCenter: _screenCenter,
        scaleModifier: _scaleModifier,
      )));
    }
    return Stack(children: planetWidgets);
  }

  drawFrame(dynamic timestamp) {
    if (!widget.animationRunning) {
      return;
    } else {
      for (Planet planet in widget.planets) {
        planet.angleInDegrees += planet.speed / fps;
      }
      setState(() {});
    }
  }
}
