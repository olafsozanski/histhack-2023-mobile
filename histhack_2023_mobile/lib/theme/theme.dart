import 'package:flutter/material.dart';

class Spacing {
  final EdgeInsets screenPadding = const EdgeInsets.all(8);

  const Spacing();
}

class AppColors {
  final MaterialColor primary = const MaterialColor(0xff9b1c1c, <int, Color>{
    50: Color(0xfffdf2f2),
    100: Color(0xfffde8e8),
    200: Color(0xfffbd5d5),
    300: Color(0xfff8b4b4),
    400: Color(0xfff98080),
    500: Color(0xfff05252),
    600: Color(0xffe02424),
    700: Color(0xffc81e1e),
    800: Color(0xff9b1c1c),
    900: Color(0xff771d1d),
  });

  final Color textPrimary = const Color(0xff161e2e);
  final Color textSecondary = const Color(0xff374151);

  final Color appBackground = const Color(0xfff4f5f7);
  AppColors();
}

class AppTheme {
  static double mainBorderRadiusValue = 10;

  static Spacing spacing = const Spacing();
  static AppColors colors = AppColors();
  static TextTheme typography = const TextTheme(
    headline1: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Color(0xff161e2e),
      fontFamily: "Inter",
    ),
    headline2: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: Color(0xff161e2e),
      fontFamily: "Inter",
    ),
    headline3: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xff161e2e),
      fontFamily: "Inter",
    ),
    headline4: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color(0xff161e2e),
      fontFamily: "Inter",
    ),
    headline5: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xff161e2e),
      fontFamily: "Inter",
    ),
    headline6: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xff161e2e),
      fontFamily: "Inter",
    ),
    bodyText1: TextStyle(
      fontFamily: "Inter",
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Color(0xff374151),
    ),
    bodyText2: TextStyle(
      fontFamily: "Inter",
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xff374151),
    ),
    button: TextStyle(
      fontFamily: "Inter",
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Color(0xff374151),
    ),
  );

  const AppTheme();
}
