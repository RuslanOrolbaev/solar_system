import 'package:flutter/material.dart';
import 'package:solar_system/view/home_screen.dart';

void main() {
  runApp(const SolarSystem());
}

class SolarSystem extends StatelessWidget {
  const SolarSystem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solar system test task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
