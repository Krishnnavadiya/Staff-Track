import 'package:flutter/material.dart';

class AppMaterialColor {
  static const MaterialColor materialColor =
      MaterialColor(_materialColorPrimaryValue, <int, Color>{
    50: Color(0xFFE8E6EE),
    100: Color(0xFFC6BFD5),
    200: Color(0xFFA195B9),
    300: Color(0xFF7B6B9C),
    400: Color(0xFF5E4B87),
    500: Color(_materialColorPrimaryValue),
    600: Color(0xFF3C266A),
    700: Color(0xFF33205F),
    800: Color(0xFF2B1A55),
    900: Color(0xFF1D1042),
  });
  static const int _materialColorPrimaryValue = 0xFF422B72;

  static const MaterialColor materialColorAccent =
      MaterialColor(_materialColorAccentValue, <int, Color>{
    100: Color(0xFF9B7DFF),
    200: Color(_materialColorAccentValue),
    400: Color(0xFF4D17FF),
    700: Color(0xFF3B00FC),
  });

  static const int _materialColorAccentValue = 0xFF744AFF;
}
