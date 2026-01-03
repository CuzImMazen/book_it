import 'package:book_it/l10n/History/history_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:book_it/features/History/data/repo/booking_history_repo.dart';

extension HistoryErrorX on BookingError {
  String localized(BuildContext context) {
    final l10n = HistoryLocalizations.of(context);
    if (l10n == null) return "Error";

    switch (this) {
      case BookingError.failedCurrentBookings:
        return l10n.bookingErrorFailedCurrentBookings;
      case BookingError.failedFutureBookings:
        return l10n.bookingErrorFailedFutureBookings;
      case BookingError.failedOldBookings:
        return l10n.bookingErrorFailedOldBookings;
      case BookingError.failedCanceledBookings:
        return l10n.bookingErrorFailedCanceledBookings;
      case BookingError.failedPendingBookings:
        return l10n.bookingErrorFailedPendingBookings;
      case BookingError.failedPendingEditBookings:
        return l10n.bookingErrorFailedPendingEditBookings;
      case BookingError.failedCancelBooking:
        return l10n.bookingErrorFailedCancelBooking;
      case BookingError.failedUpdateBooking:
        return l10n.bookingErrorFailedUpdateBooking;
      case BookingError.dateConflict:
        return l10n.bookingErrorDateConflict;
      case BookingError.failedAddRating:
        return l10n.bookingErrorFailedAddRating;
      case BookingError.failedEditRating:
        return l10n.bookingErrorFailedEditRating;
      case BookingError.unknown:
        return l10n.bookingErrorUnknown;
    }
  }
}
