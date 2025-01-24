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
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
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
      // splashFactory: NoSplash.splashFactory,
      // highlightColor: Colors.transparent,
      // splashColor: Colors.transparent,
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.all(8),
        horizontalTitleGap: 8,
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        minTileHeight: 0,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        linearMinHeight: 2,
      ),
      searchBarTheme: SearchBarThemeData(
        elevation: const WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  static _bottomNavigationBarTheme(ColorScheme colorScheme) {
    return BottomNavigationBarThemeData(
      unselectedItemColor: colorScheme.onSurface,
      selectedItemColor: colorScheme.onSurface,
      type: BottomNavigationBarType.shifting,
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
