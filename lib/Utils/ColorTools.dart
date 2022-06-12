import 'package:flutter/material.dart';

class ColorTools {
  static const int primaryColor = 0xFF03989E;

  static const int navigationBarColor = 0xFFEEEEEE;

  static const int textGrey = 0xFF858585;

  static const Color bgGrey = Color.fromRGBO(235, 235, 235, 1);

  static const MaterialColor applicationColor = MaterialColor(
    primaryColor,
    <int, Color>{
      50: Color(0xFFE1F3F3),
      100: Color(0xFFB3E0E2),
      200: Color(0xFF81CCCF),
      300: Color(0xFF4FB7BB),
      400: Color(0xFF29A7Ad),
      500: Color(primaryColor),
      600: Color(0xFF03989E),
      700: Color(0xFF039096),
      800: Color(0xFF027B82),
      900: Color(0xFF016A70),
    },
  );
}
