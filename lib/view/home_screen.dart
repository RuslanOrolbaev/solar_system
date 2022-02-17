import 'package:flutter/material.dart';
import 'package:solar_system/model/calculation_helpers/calculate_scale_modifier.dart';
import 'package:solar_system/model/calculation_helpers/farest_planet_distance.dart';
import 'package:solar_system/model/space_object.dart';
import 'package:solar_system/model/planet.dart';
import 'package:solar_system/view_model/space_object_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size _size;

  SpaceObject sun = SpaceObject(color: Colors.yellow, radius: 50);

  Planet mercury = Planet(
      radius: 30,
      color: Colors.brown,
      speed: 5,
      distanceFromCenter: 50,
      angleInDegrees: 80.0);

  Planet jupiter = Planet(
      radius: 50,
      color: Colors.red,
      speed: 5,
      distanceFromCenter: 300,
      angleInDegrees: 180);

  List<Planet> planets = [];

  @override
  void initState() {
    planets.add(mercury);
    planets.add(jupiter);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(body: Stack(children: solarBuilder(sun, planets, _size)));
  }
}

List<Widget> solarBuilder(
    SpaceObject sun, List<Planet> planets, Size screenSize) {
  Offset screenCenter = Offset(screenSize.width / 2, screenSize.height / 2);
  double longestDistance = longestPlanetDistance(planets);
  double scaleModifier = calculateScaleModifier(screenSize, longestDistance);
  List<Widget> spaceObjectWidgets = [
    SpaceObjectWidget(
        spaceObject: sun,
        scaleModifier: scaleModifier,
        screenCenter: screenCenter)
  ];
  for (Planet planet in planets) {
    spaceObjectWidgets.add(SpaceObjectWidget(
        spaceObject: planet,
        scaleModifier: scaleModifier,
        screenCenter: screenCenter));
  }
  return spaceObjectWidgets;
}
