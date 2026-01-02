import 'package:book_it/l10n/Authentication/auth_localizations.dart';
import 'package:book_it/l10n/Layout/layout_localizations.dart';
import 'package:book_it/l10n/Settings/settings_localizations.dart';
import 'package:book_it/l10n/Welcome/welcome_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationExt on BuildContext {
  AuthLocalizations get auth => AuthLocalizations.of(this)!;
  WelcomeLocalizations get welcome => WelcomeLocalizations.of(this)!;
  LayoutLocalizations get layout => LayoutLocalizations.of(this)!;
  SettingsLocalizations get settings => SettingsLocalizations.of(this)!;
}
