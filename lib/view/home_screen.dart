import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:solar_system/model/planet.dart';
import 'package:solar_system/model/providers/planet_list_provider.dart';
import 'package:solar_system/view/add_planet_screen.dart';
import 'package:solar_system/view/app_button.dart';
import 'package:solar_system/view_model/solar_builder.dart';

Logger _logger = Logger('Home screen');

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAnimationRunning = false;

  Planet mercury = Planet(
      radius: 10,
      color: Colors.brown,
      speed: 6,
      distanceFromCenter: 120,
      angleInDegrees: 0);

  Planet jupiter = Planet(
      radius: 50,
      color: Colors.red,
      speed: 5,
      distanceFromCenter: 300,
      angleInDegrees: 180);

  Planet earth = Planet(
      radius: 20,
      color: Colors.blue,
      speed: 40,
      distanceFromCenter: 150,
      angleInDegrees: 45);

  Planet uran = Planet(
      radius: 25,
      color: Colors.indigo,
      speed: 20,
      distanceFromCenter: 500,
      angleInDegrees: 160);

  List<Planet> planets = PlanetListProvider.instance.planetList;

  @override
  void initState() {
    planets.add(mercury);
    planets.add(earth);
    planets.add(jupiter);
    // planets.add(uran);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logger.info('running build');
    return Scaffold(
      body: Stack(children: [
        SolarBuilder(planets: planets, animationRunning: _isAnimationRunning),
        Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AddPlanetScreen();
                      }));
                    }),
                AppButton(
                    icon: Icon(
                      _isAnimationRunning
                          ? Icons.stop_circle_outlined
                          : Icons.play_circle_fill,
                    ),
                    onPressed: () {
                      setState(() {
                        _isAnimationRunning = !_isAnimationRunning;
                      });
                    })
              ],
            ))
      ]),
    );
  }
}
