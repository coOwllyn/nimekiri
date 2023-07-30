import 'package:flutter/material.dart';

enum LanguageType { english, ukrainian }

const String ukrainian = "uk";
const String english = "en";
const String assetsPathLocalizations = "assets/translations";
const Locale ukrainianLocal = Locale("uk", "UA");
const Locale englishLocal = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.ukrainian:
        return ukrainian;
    }
  }
}
