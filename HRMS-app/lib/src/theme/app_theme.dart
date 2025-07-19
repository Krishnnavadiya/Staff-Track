import 'package:flutter/material.dart';

abstract class AppTheme {
  static final AppLightTheme _lightTheme = AppLightTheme();
  static final AppDarkTheme _darkTheme = AppDarkTheme();

  static AppTheme of(BuildContext context) {
    bool isLight =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    if (isLight) {
      return _lightTheme;
    } else {
      return _darkTheme;
    }
  }
}

class AppLightTheme extends AppTheme {}

class AppDarkTheme extends AppTheme {}
