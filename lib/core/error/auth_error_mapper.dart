import 'package:flutter/widgets.dart';

import 'package:book_it/features/Authentication/data/repo/authentication_repo.dart';
import 'package:book_it/l10n/Authentication/auth_localizations.dart';

extension AuthErrorX on AuthError {
  String localized(BuildContext context) {
    final l10n = AuthLocalizations.of(context)!;

    switch (this) {
      case AuthError.phoneAlreadyRegistered:
        return l10n.errPhoneAlreadyRegistered;
      case AuthError.invalidPassword:
        return l10n.errInvalidPassword;
      case AuthError.accountNotApproved:
        return l10n.errAccountNotApproved;
      case AuthError.phoneNotRegistered:
        return l10n.errPhoneNotRegistered;
      case AuthError.networkError:
        return l10n.errNoInternet;
      case AuthError.serverError:
        return l10n.errServerOffline;
      case AuthError.unknown:
        return l10n.errUnexpected;
    }
  }
}
