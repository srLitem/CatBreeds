import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData get customTheme {
    const MaterialColor primaryColor = MaterialColor(0xFFE38B29, {
      50: Color(0xFFFFF3E0),
      100: Color(0xFFFCE0C2),
      200: Color(0xFFFACDA2),
      300: Color(0xFFF8B983),
      400: Color(0xFFF7AA6B),
      500: Color(0xFFF59B53),
      600: Color(0xFFF3944C),
      700: Color(0xFFF08B43),
      800: Color(0xFFEE833B),
      900: Color(0xFFEB742E),
    });
    const Color accentColor = Color.fromARGB(255, 149, 64, 58);
    const Color focusColor = Color(0xFFFFD8A9);
    const Color backgroundColor = Color(0xFFFDEEDC);
    const Color indicatorColor = Color.fromARGB(255, 149, 64, 58);

    return ThemeData(
      //* Colors
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: primaryColor,
        accentColor: accentColor,
        backgroundColor: backgroundColor,
      ),
      focusColor: focusColor,
      primaryColor: primaryColor,
      indicatorColor: indicatorColor,
      cardColor: backgroundColor,

      //*Fonts
      fontFamily: GoogleFonts.solway().fontFamily,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        displayMedium: TextStyle(
          fontSize: 22.0,
          color: primaryColor,
        ),
        titleLarge: TextStyle(
          fontSize: 20.0,
          color: primaryColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 20.0,
          color: primaryColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 18.0,
          color: primaryColor,
        ),
        bodySmall: TextStyle(
          fontSize: 16.0,
          color: accentColor,
        ),
      ),
    );
  }
}
