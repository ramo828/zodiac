import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Tema sinifi - Gece ve Gunduz modlari ucun
class AppTheme {
  // Gece modu renkleri - Gizemli kozmik tema (Neon vurgularla)
  static const Color darkNavy = Color(0xFF0A0F24);
  static const Color deepNavy = Color(0xFF11183B);
  static const Color darkBlue = Color(0xFF1A1F4C);
  static const Color veryDark = Color(0xFF0A0F24);
  static const Color primaryPurple = Color(0xFF00FFCC); // Neon Cyan 
  static const Color secondaryPurple = Color(0xFF8E2DE2); // Vibrant Purple
  static const Color auroraGreen = Color(0xFF00E676);

  // Gunduz modu renkleri - Berrak gokyuzu temasi
  static const Color lightSky = Color(0xFFF3F8FF);
  static const Color lightBlue = Color(0xFFE1F5FE);
  static const Color softBlue = Color(0xFFB3E5FC);
  static const Color lightPurple = Color(0xFFF3E5F5);
  static const Color primaryLightPurple = Color(0xFF1E88E5); // Azure Blue
  static const Color secondaryLightPurple = Color(0xFF9C27B0); // Pink/Purple
  static const Color lightGreen = Color(0xFF4FC3F7);

  // Tema yarat
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: primaryPurple,
        secondary: secondaryPurple,
        surface: Color(0xFF1A1A2E),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white70,
      ),
      scaffoldBackgroundColor: veryDark,
      fontFamily: GoogleFonts.cinzel().fontFamily,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.cinzel(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headlineLarge: GoogleFonts.cinzel(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: const [
            Shadow(color: primaryPurple, blurRadius: 15, offset: Offset(0, 0)),
          ],
        ),
        headlineMedium: GoogleFonts.cinzel(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.inter(fontSize: 16, color: Colors.white70),
        bodyMedium: GoogleFonts.inter(fontSize: 14, color: Colors.white70),
        labelLarge: GoogleFonts.inter(fontSize: 12, color: Colors.white60),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPurple,
          foregroundColor: Colors.white,
          shadowColor: secondaryPurple,
          elevation: 10,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white70,
          textStyle: GoogleFonts.inter(fontSize: 14),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: deepNavy,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: secondaryPurple, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: auroraGreen, width: 2),
        ),
        labelStyle: const TextStyle(color: Colors.white70, fontSize: 14),
        hintStyle: const TextStyle(color: Colors.white38),
        prefixIconColor: Colors.white70,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      cardTheme: CardThemeData(
        color: deepNavy,
        shadowColor: secondaryPurple,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.cinzel(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: darkNavy,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      dialogTheme: DialogThemeData(backgroundColor: deepNavy),
    );
  }

  // Gunduz modu temasi
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: primaryLightPurple,
        secondary: secondaryLightPurple,
        surface: lightSky,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black87,
      ),
      scaffoldBackgroundColor: lightBlue,
      fontFamily: GoogleFonts.cinzel().fontFamily,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.cinzel(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1A237E), // Daha koyu mavi
        ),
        headlineLarge: GoogleFonts.cinzel(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF0D47A1), // Koyu mavi
          shadows: const [
            Shadow(
              color: primaryLightPurple,
              blurRadius: 15,
              offset: Offset(0, 0),
            ),
          ],
        ),
        headlineMedium: GoogleFonts.cinzel(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1565C0), // Orta mavi
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          color: const Color(0xFF263238),
        ), // Koyu gri
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          color: const Color(0xFF37474F),
        ), // Orta koyu gri
        labelLarge: GoogleFonts.inter(
          fontSize: 12,
          color: const Color(0xFF455A64),
        ), // Açık koyu gri
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryLightPurple,
          foregroundColor: Colors.white,
          shadowColor: secondaryLightPurple,
          elevation: 10,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black87,
          textStyle: GoogleFonts.inter(fontSize: 14),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: secondaryLightPurple, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: lightGreen, width: 2),
        ),
        labelStyle: const TextStyle(color: Colors.black87, fontSize: 14),
        hintStyle: const TextStyle(color: Colors.black54),
        prefixIconColor: Colors.black87,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        shadowColor: secondaryLightPurple,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.cinzel(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: lightSky,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      dialogTheme: DialogThemeData(backgroundColor: Colors.white),
    );
  }
}
