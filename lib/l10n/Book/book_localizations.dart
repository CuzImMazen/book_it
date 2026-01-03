import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'book_localizations_ar.dart';
import 'book_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of BookLocalizations
/// returned by `BookLocalizations.of(context)`.
///
/// Applications need to include `BookLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'Book/book_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: BookLocalizations.localizationsDelegates,
///   supportedLocales: BookLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the BookLocalizations.supportedLocales
/// property.
abstract class BookLocalizations {
  BookLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static BookLocalizations? of(BuildContext context) {
    return Localizations.of<BookLocalizations>(context, BookLocalizations);
  }

  static const LocalizationsDelegate<BookLocalizations> delegate = _BookLocalizationsDelegate();

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

  /// No description provided for @book_confirm_booking.
  ///
  /// In en, this message translates to:
  /// **'Confirm your booking'**
  String get book_confirm_booking;

  /// No description provided for @book_details_prompt.
  ///
  /// In en, this message translates to:
  /// **'We need a few more details to complete your booking.'**
  String get book_details_prompt;

  /// No description provided for @book_start_date.
  ///
  /// In en, this message translates to:
  /// **'Start Date:'**
  String get book_start_date;

  /// No description provided for @book_start_date_hint.
  ///
  /// In en, this message translates to:
  /// **'Select your start Date'**
  String get book_start_date_hint;

  /// No description provided for @book_end_date.
  ///
  /// In en, this message translates to:
  /// **'End Date:'**
  String get book_end_date;

  /// No description provided for @book_end_date_hint.
  ///
  /// In en, this message translates to:
  /// **'Select your end Date'**
  String get book_end_date_hint;

  /// No description provided for @book_billing_address.
  ///
  /// In en, this message translates to:
  /// **'Billing Address:'**
  String get book_billing_address;

  /// No description provided for @book_billing_address_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your billing address'**
  String get book_billing_address_hint;

  /// No description provided for @book_card_number.
  ///
  /// In en, this message translates to:
  /// **'Card Number:'**
  String get book_card_number;

  /// No description provided for @book_card_number_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your bill card number'**
  String get book_card_number_hint;

  /// No description provided for @book_total_price.
  ///
  /// In en, this message translates to:
  /// **'Total Price: {price}\$'**
  String book_total_price(Object price);

  /// No description provided for @book_confirm_button.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get book_confirm_button;

  /// Title of the dialog shown when a booking request succeeds
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get booking_success_title;

  /// Message shown inside the success dialog after sending a booking request
  ///
  /// In en, this message translates to:
  /// **'Your booking request has been sent successfully'**
  String get booking_success_message;

  /// Text for the OK button in the booking success dialog
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get booking_success_ok;

  /// No description provided for @cardNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your card number'**
  String get cardNumberRequired;

  /// No description provided for @cardNumberTooShort.
  ///
  /// In en, this message translates to:
  /// **'Card number must be at least 12 characters'**
  String get cardNumberTooShort;

  /// No description provided for @cardNumberTooLong.
  ///
  /// In en, this message translates to:
  /// **'Card number cant be more than 19 characters'**
  String get cardNumberTooLong;

  /// No description provided for @billingAddressRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your billing address'**
  String get billingAddressRequired;

  /// No description provided for @startDateRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your start date'**
  String get startDateRequired;

  /// No description provided for @endDateRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your end date'**
  String get endDateRequired;

  /// No description provided for @bookErrorCannotBookOwnProperty.
  ///
  /// In en, this message translates to:
  /// **'You cannot book your own property.'**
  String get bookErrorCannotBookOwnProperty;

  /// No description provided for @bookErrorDateConflict.
  ///
  /// In en, this message translates to:
  /// **'The selected dates conflict with an existing booking.'**
  String get bookErrorDateConflict;

  /// No description provided for @bookErrorNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your connection.'**
  String get bookErrorNetworkError;

  /// No description provided for @bookErrorServerError.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get bookErrorServerError;

  /// No description provided for @bookErrorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error occurred. Please try again.'**
  String get bookErrorUnknown;
}

class _BookLocalizationsDelegate extends LocalizationsDelegate<BookLocalizations> {
  const _BookLocalizationsDelegate();

  @override
  Future<BookLocalizations> load(Locale locale) {
    return SynchronousFuture<BookLocalizations>(lookupBookLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_BookLocalizationsDelegate old) => false;
}

BookLocalizations lookupBookLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return BookLocalizationsAr();
    case 'en': return BookLocalizationsEn();
  }

  throw FlutterError(
    'BookLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
