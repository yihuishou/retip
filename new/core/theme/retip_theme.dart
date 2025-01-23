import 'package:flutter/material.dart';

mixin RetipTheme {
  static const fontFamily = 'Play';
  static const primaryColor = Colors.lightBlue;

  static final light = ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: primaryColor,
    fontFamily: fontFamily,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: primaryColor,
    fontFamily: fontFamily,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    ),
  );

  static final contrastLight = ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: Colors.black,
    fontFamily: fontFamily,
  );

  static final contrastDark = ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.white,
    fontFamily: fontFamily,
  );
}
