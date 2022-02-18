import 'dart:ui';

class ColorProvider {
  ColorProvider._createSingleton();

  static final ColorProvider _instance = ColorProvider._createSingleton();
  static ColorProvider get instance => _instance;

  Color? color;
}
