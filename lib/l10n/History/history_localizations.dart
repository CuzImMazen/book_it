import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'history_localizations_ar.dart';
import 'history_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of HistoryLocalizations
/// returned by `HistoryLocalizations.of(context)`.
///
/// Applications need to include `HistoryLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'History/history_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: HistoryLocalizations.localizationsDelegates,
///   supportedLocales: HistoryLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the HistoryLocalizations.supportedLocales
/// property.
abstract class HistoryLocalizations {
  HistoryLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static HistoryLocalizations? of(BuildContext context) {
    return Localizations.of<HistoryLocalizations>(context, HistoryLocalizations);
  }

  static const LocalizationsDelegate<HistoryLocalizations> delegate = _HistoryLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @history_booking_history.
  ///
  /// In en, this message translates to:
  /// **'Booking History'**
  String get history_booking_history;

  /// No description provided for @history_tab_ongoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get history_tab_ongoing;

  /// No description provided for @history_tab_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get history_tab_completed;

  /// No description provided for @history_tab_canceled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get history_tab_canceled;

  /// No description provided for @history_no_ongoing_bookings.
  ///
  /// In en, this message translates to:
  /// **'No Ongoing bookings'**
  String get history_no_ongoing_bookings;

  /// No description provided for @history_no_completed_bookings.
  ///
  /// In en, this message translates to:
  /// **'No Completed bookings'**
  String get history_no_completed_bookings;

  /// No description provided for @history_no_canceled_bookings.
  ///
  /// In en, this message translates to:
  /// **'No Canceled bookings'**
  String get history_no_canceled_bookings;

  /// No description provided for @editBooking_start_date.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get editBooking_start_date;

  /// No description provided for @editBooking_end_date.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get editBooking_end_date;

  /// No description provided for @editBooking_select_start_date_hint.
  ///
  /// In en, this message translates to:
  /// **'Select start date'**
  String get editBooking_select_start_date_hint;

  /// No description provided for @editBooking_select_end_date_hint.
  ///
  /// In en, this message translates to:
  /// **'Select end date'**
  String get editBooking_select_end_date_hint;

  /// No description provided for @editBooking_enter_end_date_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter End Date'**
  String get editBooking_enter_end_date_hint;

  /// No description provided for @editBooking_confirm_button.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get editBooking_confirm_button;

  /// No description provided for @editBooking_no_changes_message.
  ///
  /// In en, this message translates to:
  /// **'You didn’t change anything'**
  String get editBooking_no_changes_message;

  /// Price per night for the property. {price} is a variable.
  ///
  /// In en, this message translates to:
  /// **'{price}/Night'**
  String price_per_night(Object price);

  /// Title of the booking edit dialog
  ///
  /// In en, this message translates to:
  /// **'Edit Booking'**
  String get editBooking_title;

  /// Snack bar message shown after editing an upcoming booking
  ///
  /// In en, this message translates to:
  /// **'Update Booking request has been sent to Owner'**
  String get editBooking_upcomingSuccess;

  /// Snack bar message shown after editing an active booking
  ///
  /// In en, this message translates to:
  /// **'Booking update request has been sent to Owner'**
  String get editBooking_activeSuccess;

  /// Title of the cancel booking dialog
  ///
  /// In en, this message translates to:
  /// **'Cancel booking'**
  String get cancelBooking_title;

  /// Content message of the cancel booking dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this booking?'**
  String get cancelBooking_message;

  /// Negative button text in cancel booking dialog
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get cancelBooking_no;

  /// Confirm/cancel button text in cancel booking dialog
  ///
  /// In en, this message translates to:
  /// **'Cancel Booking'**
  String get cancelBooking_confirm;

  /// Error when fetching current bookings fails
  ///
  /// In en, this message translates to:
  /// **'Failed to load current bookings'**
  String get bookingErrorFailedCurrentBookings;

  /// Error when fetching future bookings fails
  ///
  /// In en, this message translates to:
  /// **'Failed to load upcoming bookings'**
  String get bookingErrorFailedFutureBookings;

  /// Error when fetching old bookings fails
  ///
  /// In en, this message translates to:
  /// **'Failed to load past bookings'**
  String get bookingErrorFailedOldBookings;

  /// Error when fetching canceled bookings fails
  ///
  /// In en, this message translates to:
  /// **'Failed to load canceled bookings'**
  String get bookingErrorFailedCanceledBookings;

  /// Error when fetching pending bookings fails
  ///
  /// In en, this message translates to:
  /// **'Failed to load pending bookings'**
  String get bookingErrorFailedPendingBookings;

  /// Error when fetching pending edit bookings fails
  ///
  /// In en, this message translates to:
  /// **'Failed to load pending edit bookings'**
  String get bookingErrorFailedPendingEditBookings;

  /// Error when canceling a booking fails
  ///
  /// In en, this message translates to:
  /// **'Failed to cancel the booking'**
  String get bookingErrorFailedCancelBooking;

  /// Error when updating a booking fails
  ///
  /// In en, this message translates to:
  /// **'Failed to update the booking'**
  String get bookingErrorFailedUpdateBooking;

  /// Error when booking update fails because dates overlap
  ///
  /// In en, this message translates to:
  /// **'Cannot update booking due to date conflict'**
  String get bookingErrorDateConflict;

  /// Error when adding a rating fails
  ///
  /// In en, this message translates to:
  /// **'Failed to add rating'**
  String get bookingErrorFailedAddRating;

  /// Error when editing a rating fails
  ///
  /// In en, this message translates to:
  /// **'Failed to edit rating'**
  String get bookingErrorFailedEditRating;

  /// Generic unknown error message
  ///
  /// In en, this message translates to:
  /// **'Unexpected error occurred'**
  String get bookingErrorUnknown;

  /// No description provided for @status_canceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get status_canceled;

  /// No description provided for @status_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get status_completed;

  /// No description provided for @status_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get status_active;

  /// No description provided for @status_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get status_pending;

  /// No description provided for @status_edit.
  ///
  /// In en, this message translates to:
  /// **'Pending Edit'**
  String get status_edit;

  /// No description provided for @status_upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get status_upcoming;
}

class _HistoryLocalizationsDelegate extends LocalizationsDelegate<HistoryLocalizations> {
  const _HistoryLocalizationsDelegate();

  @override
  Future<HistoryLocalizations> load(Locale locale) {
    return SynchronousFuture<HistoryLocalizations>(lookupHistoryLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_HistoryLocalizationsDelegate old) => false;
}

HistoryLocalizations lookupHistoryLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return HistoryLocalizationsAr();
    case 'en': return HistoryLocalizationsEn();
  }

  throw FlutterError(
    'HistoryLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
