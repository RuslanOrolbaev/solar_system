import 'package:solar_system/model/planet.dart';

double longestPlanetDistance(List<Planet> planets) {
  assert(planets.isNotEmpty);
  planets.sort((a, b) => (a.distanceFromCenter + a.radius)
      .compareTo(b.distanceFromCenter + b.radius));
  return planets.last.distanceFromCenter + planets.last.radius;
}
