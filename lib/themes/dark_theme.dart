import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.grey.shade300,
    inversePrimary: Colors.blueGrey.shade700,
    primaryContainer: Colors.grey.shade800,
    secondary: Colors.grey.shade900,
    secondaryContainer: Colors.grey.shade700,
    surface: Colors.grey.shade900,
    outlineVariant: Colors.grey.shade600,
    surfaceContainer: Colors.grey.shade800,
    tertiaryContainer: Colors.transparent,
    tertiary: Colors.white30,
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
      letterSpacing: 10.0,
    ),     
  ),
  iconTheme: const IconThemeData(
    color: Colors.white54,
    size: 30.0,
  ),
);
