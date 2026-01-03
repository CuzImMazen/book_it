import 'package:flutter/widgets.dart';
import 'package:book_it/features/Book/data/repo/book_repo.dart';
import 'package:book_it/l10n/Book/book_localizations.dart';

extension BookErrorX on BookError {
  String localized(BuildContext context) {
    final l10n = BookLocalizations.of(context);
    if (l10n == null) return "Error";
    switch (this) {
      case BookError.cannotBookOwnProperty:
        return l10n.bookErrorCannotBookOwnProperty;
      case BookError.dateConflict:
        return l10n.bookErrorDateConflict;
      case BookError.networkError:
        return l10n.bookErrorNetworkError;
      case BookError.serverError:
        return l10n.bookErrorServerError;
      case BookError.unknown:
        return l10n.bookErrorUnknown;
    }
  }
}
