import 'package:flutter/material.dart';

mixin RetipTheme {
  static Color primaryColor = Colors.lightBlue;
  static String fontFamily = 'Play';

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: primaryColor,
    );

    return ThemeData(
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      bottomNavigationBarTheme: _bottomNavigationBarTheme(colorScheme),
      iconButtonTheme: _iconButtonTheme(colorScheme),
    );
  }

  static ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: primaryColor,
    );

    return ThemeData(
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      bottomNavigationBarTheme: _bottomNavigationBarTheme(colorScheme),
      iconButtonTheme: _iconButtonTheme(colorScheme),
    );
  }

  static _bottomNavigationBarTheme(ColorScheme colorScheme) {
    return BottomNavigationBarThemeData(
      unselectedItemColor: colorScheme.outline,
      selectedItemColor: colorScheme.onSurface,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    );
  }

  static _iconButtonTheme(ColorScheme colorScheme) {
    return IconButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.all(4),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
