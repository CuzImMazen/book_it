import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LanguageState extends Equatable {
  final Locale locale;
  final String languageCode;

  const LanguageState({required this.locale, required this.languageCode});
  factory LanguageState.initial() {
    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    final String code = deviceLocale.languageCode == 'ar' ? 'ar' : 'en';
    return LanguageState(locale: Locale(code), languageCode: code);
  }
  LanguageState copyWith({Locale? locale, String? languageCode}) {
    return LanguageState(
      locale: locale ?? this.locale,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  @override
  List<Object?> get props => [locale, languageCode];
}
