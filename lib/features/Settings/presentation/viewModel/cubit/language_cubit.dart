import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  LanguageCubit() : super(LanguageState.initial());

  Future<void> changeLanguage(String code) async {
    if (state.languageCode != code) {
      emit(state.copyWith(locale: Locale(code), languageCode: code));
    }
  }

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    final code = json['languageCode'] as String?;
    if (code == 'ar' || code == 'en') {
      return LanguageState(locale: Locale(code!), languageCode: code);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    return {'languageCode': state.languageCode};
  }
}
