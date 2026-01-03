import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'owner_localizations_ar.dart';
import 'owner_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of OwnerLocalizations
/// returned by `OwnerLocalizations.of(context)`.
///
/// Applications need to include `OwnerLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'Owner/owner_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: OwnerLocalizations.localizationsDelegates,
///   supportedLocales: OwnerLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the OwnerLocalizations.supportedLocales
/// property.
abstract class OwnerLocalizations {
  OwnerLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static OwnerLocalizations? of(BuildContext context) {
    return Localizations.of<OwnerLocalizations>(context, OwnerLocalizations);
  }

  static const LocalizationsDelegate<OwnerLocalizations> delegate = _OwnerLocalizationsDelegate();

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

  /// No description provided for @myProperties_title.
  ///
  /// In en, this message translates to:
  /// **'My Properties'**
  String get myProperties_title;

  /// No description provided for @myProperties_noProperties.
  ///
  /// In en, this message translates to:
  /// **'You have no properties yet.'**
  String get myProperties_noProperties;

  /// Title of the delete property confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get deleteProperty_title;

  /// Content message of the delete property confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this property?'**
  String get deleteProperty_content;

  /// Cancel button text in delete property dialog
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get deleteProperty_cancel;

  /// Delete button text in delete property dialog
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteProperty_delete;

  /// Title of the Pending Requests screen
  ///
  /// In en, this message translates to:
  /// **'Pending Requests'**
  String get pendingRequests_title;

  /// Label of the Bookings tab
  ///
  /// In en, this message translates to:
  /// **'Bookings'**
  String get pendingRequests_tab_bookings;

  /// Label of the Modifications tab
  ///
  /// In en, this message translates to:
  /// **'Modifications'**
  String get pendingRequests_tab_modifications;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// Label for the original booking date in modification request card
  ///
  /// In en, this message translates to:
  /// **'Original Date:'**
  String get bookingRequest_originalDate;

  /// Label for the adjusted booking date in modification request card
  ///
  /// In en, this message translates to:
  /// **'Adjusted Date:'**
  String get bookingRequest_adjustedDate;

  /// Suffix for property price per night
  ///
  /// In en, this message translates to:
  /// **'/Night'**
  String get bookingRequest_perNight;

  /// Title of the Create Property screen
  ///
  /// In en, this message translates to:
  /// **'Create Property'**
  String get createProperty_title;

  /// Label for uploading property images
  ///
  /// In en, this message translates to:
  /// **'Upload Property Images:'**
  String get createProperty_uploadImages;

  /// Category House
  ///
  /// In en, this message translates to:
  /// **'House'**
  String get createProperty_category_house;

  /// Category Apartment
  ///
  /// In en, this message translates to:
  /// **'Apartment'**
  String get createProperty_category_apartment;

  /// Category Villa
  ///
  /// In en, this message translates to:
  /// **'Villa'**
  String get createProperty_category_villa;

  /// Text for the Continue button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get createProperty_continue;

  /// Snackbar message for missing images
  ///
  /// In en, this message translates to:
  /// **'Please upload at least 3 images'**
  String get createProperty_snack_uploadImages;

  /// Snackbar message for missing category
  ///
  /// In en, this message translates to:
  /// **'Please select a category'**
  String get createProperty_snack_selectCategory;

  /// Snackbar message for missing governorate
  ///
  /// In en, this message translates to:
  /// **'Please select a governorate'**
  String get createProperty_snack_selectGovernorate;

  /// Snackbar message for missing city
  ///
  /// In en, this message translates to:
  /// **'Please select a city'**
  String get createProperty_snack_selectCity;

  /// No description provided for @selectPropertyCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Property Category:'**
  String get selectPropertyCategory;

  /// No description provided for @house.
  ///
  /// In en, this message translates to:
  /// **'House'**
  String get house;

  /// No description provided for @apartment.
  ///
  /// In en, this message translates to:
  /// **'Apartment'**
  String get apartment;

  /// No description provided for @villa.
  ///
  /// In en, this message translates to:
  /// **'Villa'**
  String get villa;

  /// No description provided for @selectLocation.
  ///
  /// In en, this message translates to:
  /// **'Select Location:'**
  String get selectLocation;

  /// No description provided for @selectGovernorate.
  ///
  /// In en, this message translates to:
  /// **'Select Governorate'**
  String get selectGovernorate;

  /// No description provided for @selectCity.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get selectCity;

  /// No description provided for @theBasics.
  ///
  /// In en, this message translates to:
  /// **'The Basics'**
  String get theBasics;

  /// No description provided for @theBasicsDesc.
  ///
  /// In en, this message translates to:
  /// **'Keep the title short and catchy'**
  String get theBasicsDesc;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @descriptionDesc.
  ///
  /// In en, this message translates to:
  /// **'What will guests love?'**
  String get descriptionDesc;

  /// No description provided for @numbers.
  ///
  /// In en, this message translates to:
  /// **'Numbers'**
  String get numbers;

  /// No description provided for @priceAndArea.
  ///
  /// In en, this message translates to:
  /// **'Price & area'**
  String get priceAndArea;

  /// No description provided for @rooms.
  ///
  /// In en, this message translates to:
  /// **'Rooms'**
  String get rooms;

  /// No description provided for @howMany.
  ///
  /// In en, this message translates to:
  /// **'How many?'**
  String get howMany;

  /// No description provided for @titleHint.
  ///
  /// In en, this message translates to:
  /// **'Fancy Beach House'**
  String get titleHint;

  /// No description provided for @descriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Tell us about the view, the neighborhood...'**
  String get descriptionHint;

  /// No description provided for @priceHint.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get priceHint;

  /// No description provided for @areaHint.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get areaHint;

  /// No description provided for @createProperty.
  ///
  /// In en, this message translates to:
  /// **'Create Property'**
  String get createProperty;

  /// No description provided for @titleRequired.
  ///
  /// In en, this message translates to:
  /// **'Title required'**
  String get titleRequired;

  /// No description provided for @descriptionRequired.
  ///
  /// In en, this message translates to:
  /// **'Description required'**
  String get descriptionRequired;

  /// No description provided for @requiredd.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get requiredd;

  /// No description provided for @mustBeNumber.
  ///
  /// In en, this message translates to:
  /// **'Must be a number'**
  String get mustBeNumber;

  /// No description provided for @priceRange.
  ///
  /// In en, this message translates to:
  /// **'Price: 25–250 \$'**
  String get priceRange;

  /// No description provided for @areaRange.
  ///
  /// In en, this message translates to:
  /// **'Area: 100–1000 m²'**
  String get areaRange;

  /// No description provided for @bedrooms.
  ///
  /// In en, this message translates to:
  /// **'Bedrooms'**
  String get bedrooms;

  /// No description provided for @bathrooms.
  ///
  /// In en, this message translates to:
  /// **'Bathrooms'**
  String get bathrooms;

  /// No description provided for @kitchens.
  ///
  /// In en, this message translates to:
  /// **'Kitchens'**
  String get kitchens;

  /// No description provided for @mainImageLabel.
  ///
  /// In en, this message translates to:
  /// **'MAIN'**
  String get mainImageLabel;

  /// No description provided for @setMainImageLabel.
  ///
  /// In en, this message translates to:
  /// **'Set Main'**
  String get setMainImageLabel;

  /// No description provided for @no_pending_bookings.
  ///
  /// In en, this message translates to:
  /// **'No pending bookings'**
  String get no_pending_bookings;

  /// No description provided for @no_pending_modifications.
  ///
  /// In en, this message translates to:
  /// **'No pending modifications'**
  String get no_pending_modifications;

  /// No description provided for @property_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Property created Successfully'**
  String get property_created_successfully;

  /// No description provided for @ownerPropertyErrorConnectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out. Please try again.'**
  String get ownerPropertyErrorConnectionTimeout;

  /// No description provided for @ownerPropertyErrorServerError.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get ownerPropertyErrorServerError;

  /// No description provided for @ownerPropertyErrorFailedCreateProperty.
  ///
  /// In en, this message translates to:
  /// **'Failed to create the property.'**
  String get ownerPropertyErrorFailedCreateProperty;

  /// No description provided for @ownerPropertyErrorFailedDeleteProperty.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete the property.'**
  String get ownerPropertyErrorFailedDeleteProperty;

  /// No description provided for @ownerPropertyErrorNoPropertiesFound.
  ///
  /// In en, this message translates to:
  /// **'No properties found.'**
  String get ownerPropertyErrorNoPropertiesFound;

  /// No description provided for @ownerPropertyErrorUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get ownerPropertyErrorUnknown;

  /// No description provided for @ownerRequests_error_booking_conflict.
  ///
  /// In en, this message translates to:
  /// **'Booking can\'t be accepted due to date conflict'**
  String get ownerRequests_error_booking_conflict;

  /// No description provided for @ownerRequests_error_modification_conflict.
  ///
  /// In en, this message translates to:
  /// **'Modification can\'t be accepted due to date conflict'**
  String get ownerRequests_error_modification_conflict;

  /// No description provided for @ownerRequests_accept_success.
  ///
  /// In en, this message translates to:
  /// **'Booking request accepted successfully'**
  String get ownerRequests_accept_success;

  /// No description provided for @ownerRequests_reject_success.
  ///
  /// In en, this message translates to:
  /// **'Booking request rejected successfully'**
  String get ownerRequests_reject_success;

  /// No description provided for @ownerRequests_modification_accept_success.
  ///
  /// In en, this message translates to:
  /// **'Modification request accepted successfully'**
  String get ownerRequests_modification_accept_success;

  /// No description provided for @ownerRequests_modification_reject_success.
  ///
  /// In en, this message translates to:
  /// **'Modification request rejected successfully'**
  String get ownerRequests_modification_reject_success;

  /// No description provided for @ownerRequests_connection_timeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout. Please try again.'**
  String get ownerRequests_connection_timeout;

  /// No description provided for @ownerRequests_server_error.
  ///
  /// In en, this message translates to:
  /// **'Server error occurred. Please try again.'**
  String get ownerRequests_server_error;

  /// No description provided for @ownerRequests_unexpected_error.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error occurred'**
  String get ownerRequests_unexpected_error;
}

class _OwnerLocalizationsDelegate extends LocalizationsDelegate<OwnerLocalizations> {
  const _OwnerLocalizationsDelegate();

  @override
  Future<OwnerLocalizations> load(Locale locale) {
    return SynchronousFuture<OwnerLocalizations>(lookupOwnerLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_OwnerLocalizationsDelegate old) => false;
}

OwnerLocalizations lookupOwnerLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return OwnerLocalizationsAr();
    case 'en': return OwnerLocalizationsEn();
  }

  throw FlutterError(
    'OwnerLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
