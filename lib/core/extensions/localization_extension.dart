import 'package:book_it/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationExt on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}
