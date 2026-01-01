import 'package:flutter/material.dart';

import 'package:book_it/core/style/colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Sora",
  scaffoldBackgroundColor: Colors.white,

  primaryColor: kPrimaryColor,

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
  ),

  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
    bodyLarge: TextStyle(color: Colors.black),
  ),

  textSelectionTheme: TextSelectionThemeData(
    cursorColor: kPrimaryColor,
    selectionColor: kPrimaryColor.withValues(alpha: 0.4),
    selectionHandleColor: kPrimaryColor,
  ),

  datePickerTheme: const DatePickerThemeData(backgroundColor: Colors.white),
);
