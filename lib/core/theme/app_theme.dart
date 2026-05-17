import 'package:flutter/material.dart';

class AppColors {
  // Light theme - Yellow based
  static const Color primary = Color(0xFFFF61F8);       // Pink
  static const Color secondary = Color(0xFFFFA6FB);     // Light pink
  static const Color background = Color(0xFFFFEA6C);   // Soft yellow
  static const Color surface = Color(0xFFFFFBA7);      // Warm cream yellow
  static const Color card = Color(0xFFFFFFFF);         // White cards

  // Mood colors (complementary to yellow background)
  static const Color happy = Color(0xFFFF7043);        // Coral orange
  static const Color sad = Color(0xFF26A69A);          // Teal
  static const Color angry = Color(0xFFEF5350);        // Soft red

  // Mood gradient colors
  static const List<Color> happyGradient = [Color(0xFFFF7043), Color(0xFFFFAB40)];
  static const List<Color> sadGradient = [Color(0xFF26A69A), Color(0xFF80CBC4)];
  static const List<Color> angryGradient = [Color(0xFFEF5350), Color(0xFFFF8A80)];

  // Text colors
  static const Color textPrimary = Color(0xFF3E2723);   // Dark brown
  static const Color textSecondary = Color(0xFF6D4C41); // Medium brown

  // Accent
  static const Color accent = Color(0xFFFF61F8);        // Pink
  static const Color success = Color(0xFF66BB6A);       // Green
}

class AppTheme {
  static const String fontFamily = 'Fredoka';

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        error: AppColors.angry,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          color: AppColors.textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: fontFamily,
          color: AppColors.textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontFamily,
          color: AppColors.textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontFamily: fontFamily,
          color: AppColors.textPrimary,
          fontSize: 18,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontFamily,
          color: AppColors.textSecondary,
          fontSize: 14,
        ),
      ),
    );
  }
}
