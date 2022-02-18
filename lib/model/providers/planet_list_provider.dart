import 'package:flutter/foundation.dart';
import 'package:solar_system/model/planet.dart';

class PlanetListProvider extends ChangeNotifier {
  List<Planet> _planetList = [];

  List<Planet> get planetList => _planetList;

  set planetList(List<Planet> value) {
    _planetList = value;
    notifyListeners();
  }

  void add(Planet planet) {
    _planetList.add(planet);
    notifyListeners();
  }

  void clear() {
    _planetList.clear();
    notifyListeners();
  }
}
