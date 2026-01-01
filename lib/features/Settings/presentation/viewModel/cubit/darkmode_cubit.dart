import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'darkmode_state.dart';

class DarkmodedCubit extends HydratedCubit<DarkmodeState> {
  DarkmodedCubit() : super(DarkmodeState(themeMode: ThemeMode.system));

  @override
  DarkmodeState fromJson(Map<String, dynamic> json) {
    return DarkmodeState(themeMode: ThemeMode.values[json['themeMode'] as int]);
  }

  @override
  Map<String, dynamic> toJson(DarkmodeState state) {
    return {'themeMode': state.themeMode.index};
  }

  void toggleTheme(bool isDark) {
    emit(state.copyWith(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
  }
}
