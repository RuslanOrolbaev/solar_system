import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:solar_system/constants.dart';
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
  late List<Planet> planets;

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

  Planet uranium = Planet(
      radius: 25,
      color: Colors.indigo,
      speed: 20,
      distanceFromCenter: 500,
      angleInDegrees: 160);

  @override
  void initState() {
    _logger.info(initMessage);
    planets = context.read<PlanetListProvider>().planetList;
    planets.add(mercury);
    planets.add(earth);
    planets.add(jupiter);
    planets.add(uranium);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<PlanetListProvider>();
    _logger.info(buildMessage);
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
