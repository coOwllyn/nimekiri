import 'package:flutter/material.dart';

class ColorManager {
  // light theme
  static Color primaryGreen = HexColor.fromHex("#0FA09B");
  static Color accentRed = HexColor.fromHex("#F9706E");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color whiteGreen = HexColor.fromHex("#E7F5F5");
  static Color black = HexColor.fromHex("#181818");
  static Color grey = HexColor.fromHex("#8C8C8C");
  static Color ligthGrey = HexColor.fromHex("#F3F3F3");

  // dark theme
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
