import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'auth_localizations_ar.dart';
import 'auth_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AuthLocalizations
/// returned by `AuthLocalizations.of(context)`.
///
/// Applications need to include `AuthLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'Authentication/auth_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AuthLocalizations.localizationsDelegates,
///   supportedLocales: AuthLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AuthLocalizations.supportedLocales
/// property.
abstract class AuthLocalizations {
  AuthLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AuthLocalizations? of(BuildContext context) {
    return Localizations.of<AuthLocalizations>(context, AuthLocalizations);
  }

  static const LocalizationsDelegate<AuthLocalizations> delegate = _AuthLocalizationsDelegate();

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

  /// No description provided for @auth_welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get auth_welcomeBack;

  /// No description provided for @auth_loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Log in to your account to explore your dream home and live your best life.'**
  String get auth_loginSubtitle;

  /// No description provided for @auth_phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get auth_phoneNumber;

  /// No description provided for @auth_enterPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get auth_enterPhone;

  /// No description provided for @auth_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get auth_password;

  /// No description provided for @auth_enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get auth_enterPassword;

  /// No description provided for @auth_signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get auth_signIn;

  /// No description provided for @auth_noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get auth_noAccount;

  /// No description provided for @auth_createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create new account'**
  String get auth_createAccount;

  /// No description provided for @auth_accountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get auth_accountCreated;

  /// No description provided for @auth_signedInSuccess.
  ///
  /// In en, this message translates to:
  /// **'You signed in successfully'**
  String get auth_signedInSuccess;

  /// No description provided for @auth_signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s explore together!'**
  String get auth_signupTitle;

  /// No description provided for @auth_signupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your account to start listing or renting homes instantly.'**
  String get auth_signupSubtitle;

  /// No description provided for @auth_enterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Enter your first name'**
  String get auth_enterFirstName;

  /// No description provided for @auth_enterLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter your last name'**
  String get auth_enterLastName;

  /// No description provided for @auth_firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get auth_firstName;

  /// No description provided for @auth_lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get auth_lastName;

  /// No description provided for @auth_selectBirthDate.
  ///
  /// In en, this message translates to:
  /// **'Select your birth date'**
  String get auth_selectBirthDate;

  /// No description provided for @auth_birthDate.
  ///
  /// In en, this message translates to:
  /// **'Birth Date'**
  String get auth_birthDate;

  /// No description provided for @auth_uploadProfile.
  ///
  /// In en, this message translates to:
  /// **'Tap to upload your profile image'**
  String get auth_uploadProfile;

  /// No description provided for @auth_uploadId.
  ///
  /// In en, this message translates to:
  /// **'Tap to upload your ID image'**
  String get auth_uploadId;

  /// No description provided for @auth_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get auth_continue;

  /// No description provided for @auth_pleaseUploadProfile.
  ///
  /// In en, this message translates to:
  /// **'Please upload a profile image'**
  String get auth_pleaseUploadProfile;

  /// No description provided for @auth_pleaseUploadId.
  ///
  /// In en, this message translates to:
  /// **'Please upload an ID image'**
  String get auth_pleaseUploadId;

  /// No description provided for @auth_finishAccount.
  ///
  /// In en, this message translates to:
  /// **'Finish Your Account!'**
  String get auth_finishAccount;

  /// No description provided for @auth_finishSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome aboard! Your account is almost done. Discover homes, list properties, and get started today.'**
  String get auth_finishSubtitle;

  /// No description provided for @auth_confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get auth_confirmPassword;

  /// No description provided for @auth_chooseRole.
  ///
  /// In en, this message translates to:
  /// **'Choose Role'**
  String get auth_chooseRole;

  /// No description provided for @auth_owner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get auth_owner;

  /// No description provided for @auth_renter.
  ///
  /// In en, this message translates to:
  /// **'Renter'**
  String get auth_renter;

  /// No description provided for @auth_signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get auth_signUp;

  /// No description provided for @auth_couldntUploadImage.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t upload image'**
  String get auth_couldntUploadImage;

  /// No description provided for @errPhoneEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get errPhoneEmpty;

  /// No description provided for @errPhoneLength.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be 10 characters'**
  String get errPhoneLength;

  /// No description provided for @errPhoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get errPhoneInvalid;

  /// No description provided for @errPasswordEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get errPasswordEmpty;

  /// No description provided for @errPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get errPasswordLength;

  /// No description provided for @errNameEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get errNameEmpty;

  /// No description provided for @errNameTooLong.
  ///
  /// In en, this message translates to:
  /// **'That name is too long'**
  String get errNameTooLong;

  /// No description provided for @errConfirmPasswordEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get errConfirmPasswordEmpty;

  /// No description provided for @errPasswordsNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get errPasswordsNotMatch;

  /// No description provided for @errBirthDateEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your birth date'**
  String get errBirthDateEmpty;

  /// No description provided for @errPhoneAlreadyRegistered.
  ///
  /// In en, this message translates to:
  /// **'This phone number is already registered'**
  String get errPhoneAlreadyRegistered;

  /// No description provided for @errAccountNotApproved.
  ///
  /// In en, this message translates to:
  /// **'Your account is not approved yet'**
  String get errAccountNotApproved;

  /// No description provided for @errPhoneNotRegistered.
  ///
  /// In en, this message translates to:
  /// **'This phone number is not registered'**
  String get errPhoneNotRegistered;

  /// No description provided for @errInvalidPassword.
  ///
  /// In en, this message translates to:
  /// **'The password you entered is incorrect'**
  String get errInvalidPassword;

  /// No description provided for @errServerOffline.
  ///
  /// In en, this message translates to:
  /// **'Server is down or offline, please try again later'**
  String get errServerOffline;

  /// No description provided for @errRequestFailed.
  ///
  /// In en, this message translates to:
  /// **'Request failed'**
  String get errRequestFailed;

  /// No description provided for @errConnectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Server not responding, please try again later'**
  String get errConnectionTimeout;

  /// No description provided for @errNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection or server can\'t be reached'**
  String get errNoInternet;

  /// No description provided for @errUnexpected.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error'**
  String get errUnexpected;

  /// No description provided for @errNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network or server error'**
  String get errNetwork;
}

class _AuthLocalizationsDelegate extends LocalizationsDelegate<AuthLocalizations> {
  const _AuthLocalizationsDelegate();

  @override
  Future<AuthLocalizations> load(Locale locale) {
    return SynchronousFuture<AuthLocalizations>(lookupAuthLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AuthLocalizationsDelegate old) => false;
}

AuthLocalizations lookupAuthLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AuthLocalizationsAr();
    case 'en': return AuthLocalizationsEn();
  }

  throw FlutterError(
    'AuthLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
