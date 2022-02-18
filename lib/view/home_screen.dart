import 'package:flutter/cupertino.dart';
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

  Planet venus = Planet(
      radius: 20,
      color: Colors.green,
      speed: 10,
      distanceFromCenter: 150,
      angleInDegrees: 40);

  Planet earth = Planet(
      radius: 25,
      color: Colors.blue,
      speed: 14,
      distanceFromCenter: 200,
      angleInDegrees: 300);

  Planet mars = Planet(
      radius: 23,
      color: Colors.red,
      speed: 20,
      distanceFromCenter: 290,
      angleInDegrees: 160);

  Planet jupiter = Planet(
      radius: 50,
      color: Colors.brown,
      speed: 5,
      distanceFromCenter: 400,
      angleInDegrees: 180);

  @override
  void initState() {
    _logger.info(initMessage);
    context.read<PlanetListProvider>().planetList = [
      mercury,
      venus,
      earth,
      mars,
      jupiter
    ];
    planets = context.read<PlanetListProvider>().planetList;
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
