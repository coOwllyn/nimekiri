import 'package:flutter/material.dart';

class AppColors {
  // light theme
  static Color primaryNavy = HexColor.fromHex('#251FA2');
  static Color accentRed = HexColor.fromHex('#FB7E73');
  static Color accentYellow = HexColor.fromHex('#F1FEA4');
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color darkNavy = HexColor.fromHex('#151680');
  static Color lightNavy = HexColor.fromHex('#bbd3fb');
  static Color whiteNavy = HexColor.fromHex('#E3EAFB');
  static Color black = HexColor.fromHex('#181818');
  static Color grey = HexColor.fromHex('#8C8C8C');
  static Color lightGrey = HexColor.fromHex('#F3F3F3');

  // dark theme
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString'; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
