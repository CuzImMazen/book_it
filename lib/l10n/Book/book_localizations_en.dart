// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'book_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class BookLocalizationsEn extends BookLocalizations {
  BookLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get book_confirm_booking => 'Confirm your booking';

  @override
  String get book_details_prompt => 'We need a few more details to complete your booking.';

  @override
  String get book_start_date => 'Start Date:';

  @override
  String get book_start_date_hint => 'Select your start Date';

  @override
  String get book_end_date => 'End Date:';

  @override
  String get book_end_date_hint => 'Select your end Date';

  @override
  String get book_billing_address => 'Billing Address:';

  @override
  String get book_billing_address_hint => 'Enter your billing address';

  @override
  String get book_card_number => 'Card Number:';

  @override
  String get book_card_number_hint => 'Enter your bill card number';

  @override
  String book_total_price(Object price) {
    return 'Total Price: $price\$';
  }

  @override
  String get book_confirm_button => 'Confirm';

  @override
  String get booking_success_title => 'Success';

  @override
  String get booking_success_message => 'Your booking request has been sent successfully';

  @override
  String get booking_success_ok => 'OK';

  @override
  String get cardNumberRequired => 'Please enter your card number';

  @override
  String get cardNumberTooShort => 'Card number must be at least 12 characters';

  @override
  String get cardNumberTooLong => 'Card number cant be more than 19 characters';

  @override
  String get billingAddressRequired => 'Please enter your billing address';

  @override
  String get startDateRequired => 'Please enter your start date';

  @override
  String get endDateRequired => 'Please enter your end date';

  @override
  String get bookErrorCannotBookOwnProperty => 'You cannot book your own property.';

  @override
  String get bookErrorDateConflict => 'The selected dates conflict with an existing booking.';

  @override
  String get bookErrorNetworkError => 'Network error. Please check your connection.';

  @override
  String get bookErrorServerError => 'Server error. Please try again later.';

  @override
  String get bookErrorUnknown => 'Unexpected error occurred. Please try again.';
}
