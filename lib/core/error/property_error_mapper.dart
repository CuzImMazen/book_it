import 'package:book_it/l10n/Home/home_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:book_it/features/Home/data/repo/property_repo.dart';

extension PropertyErrorX on PropertyError {
  String localized(BuildContext context) {
    final l10n = HomeLocalizations.of(context);
    if (l10n == null) return "Error";

    switch (this) {
      case PropertyError.connectionTimeout:
        return l10n.propertyErrorConnectionTimeout;
      case PropertyError.serverError:
        return l10n.propertyErrorServerError;
      case PropertyError.unauthorizedRating:
        return l10n.propertyErrorUnauthorizedRating;
      case PropertyError.noPropertiesFound:
        return l10n.propertyErrorNoPropertiesFound;
      case PropertyError.unknown:
        return l10n.propertyErrorUnknown;
    }
  }
}
