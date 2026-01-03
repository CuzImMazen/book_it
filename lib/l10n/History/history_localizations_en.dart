// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'history_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class HistoryLocalizationsEn extends HistoryLocalizations {
  HistoryLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get history_booking_history => 'Booking History';

  @override
  String get history_tab_ongoing => 'Ongoing';

  @override
  String get history_tab_completed => 'Completed';

  @override
  String get history_tab_canceled => 'Cancelled';

  @override
  String get history_no_ongoing_bookings => 'No Ongoing bookings';

  @override
  String get history_no_completed_bookings => 'No Completed bookings';

  @override
  String get history_no_canceled_bookings => 'No Canceled bookings';

  @override
  String get editBooking_start_date => 'Start Date';

  @override
  String get editBooking_end_date => 'End Date';

  @override
  String get editBooking_select_start_date_hint => 'Select start date';

  @override
  String get editBooking_select_end_date_hint => 'Select end date';

  @override
  String get editBooking_enter_end_date_hint => 'Enter End Date';

  @override
  String get editBooking_confirm_button => 'Confirm';

  @override
  String get editBooking_no_changes_message => 'You didn’t change anything';

  @override
  String price_per_night(Object price) {
    return '$price/Night';
  }

  @override
  String get editBooking_title => 'Edit Booking';

  @override
  String get editBooking_upcomingSuccess => 'Update Booking request has been sent to Owner';

  @override
  String get editBooking_activeSuccess => 'Booking update request has been sent to Owner';

  @override
  String get cancelBooking_title => 'Cancel booking';

  @override
  String get cancelBooking_message => 'Are you sure you want to cancel this booking?';

  @override
  String get cancelBooking_no => 'No';

  @override
  String get cancelBooking_confirm => 'Cancel Booking';

  @override
  String get bookingErrorFailedCurrentBookings => 'Failed to load current bookings';

  @override
  String get bookingErrorFailedFutureBookings => 'Failed to load upcoming bookings';

  @override
  String get bookingErrorFailedOldBookings => 'Failed to load past bookings';

  @override
  String get bookingErrorFailedCanceledBookings => 'Failed to load canceled bookings';

  @override
  String get bookingErrorFailedPendingBookings => 'Failed to load pending bookings';

  @override
  String get bookingErrorFailedPendingEditBookings => 'Failed to load pending edit bookings';

  @override
  String get bookingErrorFailedCancelBooking => 'Failed to cancel the booking';

  @override
  String get bookingErrorFailedUpdateBooking => 'Failed to update the booking';

  @override
  String get bookingErrorDateConflict => 'Cannot update booking due to date conflict';

  @override
  String get bookingErrorFailedAddRating => 'Failed to add rating';

  @override
  String get bookingErrorFailedEditRating => 'Failed to edit rating';

  @override
  String get bookingErrorUnknown => 'Unexpected error occurred';

  @override
  String get status_canceled => 'Canceled';

  @override
  String get status_completed => 'Completed';

  @override
  String get status_active => 'Active';

  @override
  String get status_pending => 'Pending';

  @override
  String get status_edit => 'Pending Edit';

  @override
  String get status_upcoming => 'Upcoming';
}
