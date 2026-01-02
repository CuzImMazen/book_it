import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'welcome_localizations_ar.dart';
import 'welcome_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of WelcomeLocalizations
/// returned by `WelcomeLocalizations.of(context)`.
///
/// Applications need to include `WelcomeLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'Welcome/welcome_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: WelcomeLocalizations.localizationsDelegates,
///   supportedLocales: WelcomeLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the WelcomeLocalizations.supportedLocales
/// property.
abstract class WelcomeLocalizations {
  WelcomeLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static WelcomeLocalizations? of(BuildContext context) {
    return Localizations.of<WelcomeLocalizations>(context, WelcomeLocalizations);
  }

  static const LocalizationsDelegate<WelcomeLocalizations> delegate = _WelcomeLocalizationsDelegate();

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

  /// No description provided for @welcomePrimary1.
  ///
  /// In en, this message translates to:
  /// **'Find the Best Place'**
  String get welcomePrimary1;

  /// No description provided for @welcomePrimary2.
  ///
  /// In en, this message translates to:
  /// **'For Rent In Good Price'**
  String get welcomePrimary2;

  /// No description provided for @welcomeSecondary1.
  ///
  /// In en, this message translates to:
  /// **'Find your perfect home with ease. Browse,'**
  String get welcomeSecondary1;

  /// No description provided for @welcomeSecondary2.
  ///
  /// In en, this message translates to:
  /// **'and book rental properties anytime, anywhere.'**
  String get welcomeSecondary2;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;
}

class _WelcomeLocalizationsDelegate extends LocalizationsDelegate<WelcomeLocalizations> {
  const _WelcomeLocalizationsDelegate();

  @override
  Future<WelcomeLocalizations> load(Locale locale) {
    return SynchronousFuture<WelcomeLocalizations>(lookupWelcomeLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_WelcomeLocalizationsDelegate old) => false;
}

WelcomeLocalizations lookupWelcomeLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return WelcomeLocalizationsAr();
    case 'en': return WelcomeLocalizationsEn();
  }

  throw FlutterError(
    'WelcomeLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
