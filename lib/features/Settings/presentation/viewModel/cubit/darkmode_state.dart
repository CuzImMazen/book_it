import 'package:flutter/material.dart';

class DarkmodeState {
  final ThemeMode themeMode;

  const DarkmodeState({required this.themeMode});
  DarkmodeState copyWith({ThemeMode? themeMode}) {
    return DarkmodeState(themeMode: themeMode ?? this.themeMode);
  }
}
