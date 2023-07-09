import 'package:flutter/material.dart';

class FlutterTodosTheme {
  static ThemeData get light {
    return ThemeData(
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Color(0xFF9575CD), //purple 4
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: const Color(0xFFD1C4E9), //purple 2
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Color(0xFF5E35B1), //purple 4
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: const Color(0xFF4527A0), //purple 2
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
