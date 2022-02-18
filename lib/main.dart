import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logging/logging.dart';
import 'package:solar_system/view/home_screen.dart';

void main() {
  _initLogging();
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
        textTheme: GoogleFonts.fredokaOneTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

void _initLogging() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print(
          '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
    }
  });
}
