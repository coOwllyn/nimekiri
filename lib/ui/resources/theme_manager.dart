import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/resources/color_manager.dart';
import 'package:todo_bloc/ui/resources/style_manager.dart';
import 'package:todo_bloc/ui/resources/values_manager.dart';

class FlutterTodosTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: ColorManager.white,
        elevation: AppSize.s0,
        titleTextStyle: getHeaderStyle(color: ColorManager.black),
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: ColorManager.accentRed,
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
        color: ColorManager.black,
        elevation: AppSize.s0,
        titleTextStyle: getHeaderStyle(color: ColorManager.white),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: ColorManager.accentRed,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
