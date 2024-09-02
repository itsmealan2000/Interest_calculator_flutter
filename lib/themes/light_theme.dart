import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.black,
    inversePrimary: Colors.blue.shade500,
    primaryContainer: Colors.blue.shade300,
    secondary: Colors.white,
    secondaryContainer: const Color.fromARGB(255, 245, 0, 79),
    surface: Colors.white,
    outlineVariant: Colors.blue.shade900,
    surfaceContainer: const Color.fromARGB(255, 209, 233, 246),
    tertiaryContainer: Colors.transparent,
    tertiary: Colors.white38,
  ),
  textTheme: TextTheme(
      displaySmall: GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.white,
      ),
      titleSmall: GoogleFonts.bebasNeue(
        fontSize: 40.0,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 25.0,
      ),
      titleLarge: GoogleFonts.roadRage(
        fontSize: 40.0,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 40.0,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 20.0,
      ),
      bodyLarge: GoogleFonts.bebasNeue(
        fontSize: 30.0,
      ),
      labelSmall: GoogleFonts.bebasNeue(
       fontSize: 20.0,
       letterSpacing: 10.0
      ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
    size: 30.0,
  ),
  primaryIconTheme: const IconThemeData(
    color: Colors.black,
    size: 30.0,
  ),
);
