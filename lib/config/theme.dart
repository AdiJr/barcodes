import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  /// Colors
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  static TextStyle getTextStyle({
    double size = 16,
    Color color = black,
    FontWeight weight = FontWeight.normal,
  }) {
    return TextStyle(
      fontFamily: GoogleFonts.openSans().fontFamily,
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: 0,
    );
  }

  /// Themes
  static const int _primaryColor = 0xFF4B7AF7;
  static const MaterialColor primarySwatch = MaterialColor(
    _primaryColor,
    <int, Color>{
      50: Color(0xFFECEDFD),
      100: Color(0xFFD0D1FB),
      200: Color(0xFF4B7AF7),
      300: Color(0xFF4B7AF7),
      400: Color(0xFF4B7AF7),
      500: Color(0xFF4B7AF7),
      600: Color(0xFF4B7AF7),
      700: Color(0xFF4B7AF7),
      800: Color(0xFF4B7AF7),
      900: Color(0xFF3538E7),
    },
  );

  static final lightTheme = ThemeData(
    primarySwatch: primarySwatch,
    brightness: Brightness.light,
    scaffoldBackgroundColor: white,
    backgroundColor: white,
    cardColor: const Color(0x00F2F2F2),
    bottomAppBarColor: white,
    dividerColor: const Color(0x1C000000),
  );

  static final darkTheme = lightTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF24242a),
    backgroundColor: const Color(0xFF24242a),
    cardColor: const Color(0xFF2f2f34),
    bottomAppBarColor: const Color(0xFF35353a),
    dividerColor: const Color(0x1CFFFFFF),
  );
}
