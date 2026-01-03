import 'package:book_it/l10n/Owner/owner_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:book_it/features/Owner/data/repo/owner_properties_repo.dart';

extension OwnerPropertyErrorX on OwnerPropertyError {
  String localized(BuildContext context) {
    final l10n = OwnerLocalizations.of(context)!;

    switch (this) {
      case OwnerPropertyError.connectionTimeout:
        return l10n.ownerPropertyErrorConnectionTimeout;
      case OwnerPropertyError.serverError:
        return l10n.ownerPropertyErrorServerError;
      case OwnerPropertyError.failedCreateProperty:
        return l10n.ownerPropertyErrorFailedCreateProperty;
      case OwnerPropertyError.failedDeleteProperty:
        return l10n.ownerPropertyErrorFailedDeleteProperty;
      case OwnerPropertyError.noPropertiesFound:
        return l10n.ownerPropertyErrorNoPropertiesFound;
      case OwnerPropertyError.unknown:
        return l10n.ownerPropertyErrorUnknown;
    }
  }
}
