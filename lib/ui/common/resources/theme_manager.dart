import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';

class FlutterTodosTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: AppColors.white,
        elevation: 0,
        titleTextStyle: getHeaderStyle(color: AppColors.black, fontSize: 20),
      ),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: AppColors.white),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.accentRed,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: AppColors.black,
        elevation: 0,
        titleTextStyle: getHeaderStyle(color: AppColors.white, fontSize: 20),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: AppColors.accentRed,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
