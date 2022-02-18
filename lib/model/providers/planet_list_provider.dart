import 'package:solar_system/model/planet.dart';

class PlanetListProvider {
  PlanetListProvider._createSingleton();

  static final PlanetListProvider _instance =
      PlanetListProvider._createSingleton();
  static PlanetListProvider get instance => _instance;

  List<Planet> planetList = [];
}
