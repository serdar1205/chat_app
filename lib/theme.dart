import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


abstract class AppColors{
  static const secondary = Color(0xFF3B76F6);
  static const accent = Color(0xFFD67558);
  static const textDark = Color(0xFF53585A);
  static const textLight = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
}

abstract class _LightColors{
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors{
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

abstract class AppTheme{
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  ///Light theme
  static ThemeData light() => ThemeData(

    brightness: Brightness.light,
    accentColor: accentColor,
    visualDensity: visualDensity,
    appBarTheme: AppBarTheme(titleTextStyle: TextStyle(color: AppColors.textDark)),
    textTheme: GoogleFonts.mulishTextTheme().apply(
      bodyColor: AppColors.textDark
    ),
    backgroundColor: _LightColors.background,
    scaffoldBackgroundColor: _LightColors.background,
    cardColor: _LightColors.card,
    primaryTextTheme: TextTheme(
      headline6: TextStyle(color: AppColors.textDark)
    ),
    iconTheme: IconThemeData(color: AppColors.iconDark)
  );

  ///Dark theme
  static ThemeData dark() => ThemeData(
      brightness: Brightness.dark,
      accentColor: accentColor,
      visualDensity: visualDensity,
      appBarTheme: AppBarTheme(titleTextStyle: TextStyle(color: AppColors.textLight)),
      textTheme: GoogleFonts.mulishTextTheme().apply(
          bodyColor: AppColors.textLight
      ),
      backgroundColor: _DarkColors.background,
      scaffoldBackgroundColor: _DarkColors.background,
      cardColor: _DarkColors.card,
      primaryTextTheme: TextTheme(
          headline6: TextStyle(color: AppColors.textLight)
      ),
      iconTheme: IconThemeData(color: AppColors.iconLight)
  );

}