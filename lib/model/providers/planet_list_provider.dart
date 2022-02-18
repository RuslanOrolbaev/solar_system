import 'package:flutter/foundation.dart';
import 'package:solar_system/model/planet.dart';

class PlanetListProvider extends ChangeNotifier {
  List<Planet> planetList = [];

  void add(Planet planet) {
    planetList.add(planet);
    notifyListeners();
  }
}
