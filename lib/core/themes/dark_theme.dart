import 'package:flutter/material.dart';
import 'package:book_it/core/style/colors.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  fontFamily: "Sora",

  scaffoldBackgroundColor: const Color(0xFF0E1116),
  canvasColor: const Color(0xFF0E1116),

  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimaryColor,
    brightness: Brightness.dark,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0E1116),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
  ),

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Color(0xFFE6EDF3),
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(color: Color(0xFFC9D1D9), fontSize: 16),
    bodyMedium: TextStyle(color: Color(0xFFB1BAC4), fontSize: 14),
  ),

  cardTheme: const CardThemeData(
    color: Color(0xFF161B22),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF161B22),
    hintStyle: const TextStyle(color: Color(0xFF8B949E)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: kPrimaryColor, width: 1.4),
    ),
  ),

  textSelectionTheme: TextSelectionThemeData(
    cursorColor: kPrimaryColor,
    selectionColor: kPrimaryColor.withAlpha(90),
    selectionHandleColor: kPrimaryColor,
  ),

  dividerTheme: const DividerThemeData(
    color: Color(0xFF21262D),
    thickness: 0.6,
  ),
);
