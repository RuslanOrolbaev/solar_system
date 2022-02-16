import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:solar_system/model/planet.dart';
import 'package:solar_system/view_model/solar_builder.dart';

Logger _logger = Logger('Home screen');

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size _screenSize;
  bool _isAnimationRunning = false;

  Planet mercury = Planet(
      radius: 10,
      color: Colors.brown,
      speed: 5,
      distanceFromCenter: 100,
      angleInDegrees: 80.0);

  Planet jupiter = Planet(
      radius: 50,
      color: Colors.red,
      speed: 5,
      distanceFromCenter: 300,
      angleInDegrees: 180);

  Planet earth = Planet(
      radius: 20,
      color: Colors.blue,
      speed: 4,
      distanceFromCenter: 150,
      angleInDegrees: 45);

  Planet uran = Planet(
      radius: 25,
      color: Colors.indigo,
      speed: 20,
      distanceFromCenter: 500,
      angleInDegrees: 160);

  List<Planet> planets = [];

  @override
  void initState() {
    planets.add(mercury);
    // planets.add(earth);
    // planets.add(jupiter);
    // planets.add(uran);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logger.info('running build');
    _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SolarBuilder(
          planets: planets,
          screenSize: _screenSize,
          animationRunning: _isAnimationRunning),
      floatingActionButton: FloatingActionButton(
          child: Icon(
              _isAnimationRunning
                  ? Icons.stop_circle_outlined
                  : Icons.play_circle_fill,
              size: 40,
              color: Colors.white),
          onPressed: () {
            setState(() {
              _isAnimationRunning = !_isAnimationRunning;
            });
          }),
    );
  }
}
