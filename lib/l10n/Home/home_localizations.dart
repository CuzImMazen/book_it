import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'home_localizations_ar.dart';
import 'home_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of HomeLocalizations
/// returned by `HomeLocalizations.of(context)`.
///
/// Applications need to include `HomeLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'Home/home_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: HomeLocalizations.localizationsDelegates,
///   supportedLocales: HomeLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the HomeLocalizations.supportedLocales
/// property.
abstract class HomeLocalizations {
  HomeLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static HomeLocalizations? of(BuildContext context) {
    return Localizations.of<HomeLocalizations>(context, HomeLocalizations);
  }

  static const LocalizationsDelegate<HomeLocalizations> delegate = _HomeLocalizationsDelegate();

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
    Locale('en'),
    Locale('ar')
  ];

  /// No description provided for @filters_title.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters_title;

  /// No description provided for @filters_governorate.
  ///
  /// In en, this message translates to:
  /// **'Governorate :'**
  String get filters_governorate;

  /// No description provided for @filters_select_governorate.
  ///
  /// In en, this message translates to:
  /// **'Select Governorate'**
  String get filters_select_governorate;

  /// No description provided for @filters_choose_city.
  ///
  /// In en, this message translates to:
  /// **'Choose a City :'**
  String get filters_choose_city;

  /// No description provided for @filters_select_city.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get filters_select_city;

  /// No description provided for @filters_price.
  ///
  /// In en, this message translates to:
  /// **'Price :'**
  String get filters_price;

  /// No description provided for @filters_area.
  ///
  /// In en, this message translates to:
  /// **'Area :'**
  String get filters_area;

  /// No description provided for @filters_num_bedrooms.
  ///
  /// In en, this message translates to:
  /// **'Num of Bedrooms :'**
  String get filters_num_bedrooms;

  /// No description provided for @filters_num_bathrooms.
  ///
  /// In en, this message translates to:
  /// **'Num of Bathrooms :'**
  String get filters_num_bathrooms;

  /// No description provided for @filters_num_kitchens.
  ///
  /// In en, this message translates to:
  /// **'Num of Kitchens :'**
  String get filters_num_kitchens;

  /// No description provided for @filters_only_available.
  ///
  /// In en, this message translates to:
  /// **'Only Available'**
  String get filters_only_available;

  /// No description provided for @filters_apply_button.
  ///
  /// In en, this message translates to:
  /// **'Apply Filter'**
  String get filters_apply_button;

  /// No description provided for @onlyShowAvailableProperties.
  ///
  /// In en, this message translates to:
  /// **'Only show available properties'**
  String get onlyShowAvailableProperties;

  /// No description provided for @any.
  ///
  /// In en, this message translates to:
  /// **'Any'**
  String get any;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get min;

  /// No description provided for @max.
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get max;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @damascus.
  ///
  /// In en, this message translates to:
  /// **'Damascus'**
  String get damascus;

  /// No description provided for @ruralDamascus.
  ///
  /// In en, this message translates to:
  /// **'Rural Damascus'**
  String get ruralDamascus;

  /// No description provided for @aleppo.
  ///
  /// In en, this message translates to:
  /// **'Aleppo'**
  String get aleppo;

  /// No description provided for @idlib.
  ///
  /// In en, this message translates to:
  /// **'Idlib'**
  String get idlib;

  /// No description provided for @homs.
  ///
  /// In en, this message translates to:
  /// **'Homs'**
  String get homs;

  /// No description provided for @hama.
  ///
  /// In en, this message translates to:
  /// **'Hama'**
  String get hama;

  /// No description provided for @latakia.
  ///
  /// In en, this message translates to:
  /// **'Latakia'**
  String get latakia;

  /// No description provided for @tartus.
  ///
  /// In en, this message translates to:
  /// **'Tartus'**
  String get tartus;

  /// No description provided for @sweidah.
  ///
  /// In en, this message translates to:
  /// **'Sweidah'**
  String get sweidah;

  /// No description provided for @daraa.
  ///
  /// In en, this message translates to:
  /// **'Dara\'a'**
  String get daraa;

  /// No description provided for @hassakeh.
  ///
  /// In en, this message translates to:
  /// **'Hassakeh'**
  String get hassakeh;

  /// No description provided for @deirAlzoor.
  ///
  /// In en, this message translates to:
  /// **'Deir Alzoor'**
  String get deirAlzoor;

  /// No description provided for @alraqqa.
  ///
  /// In en, this message translates to:
  /// **'Alraqqa'**
  String get alraqqa;

  /// No description provided for @alQuneitra.
  ///
  /// In en, this message translates to:
  /// **'AlQuneitra'**
  String get alQuneitra;

  /// No description provided for @damascus_alQadam.
  ///
  /// In en, this message translates to:
  /// **'Al-Qadam'**
  String get damascus_alQadam;

  /// No description provided for @damascus_mazzeh.
  ///
  /// In en, this message translates to:
  /// **'Mazzeh'**
  String get damascus_mazzeh;

  /// No description provided for @damascus_alSalihiyah.
  ///
  /// In en, this message translates to:
  /// **'Al-Salihiyah'**
  String get damascus_alSalihiyah;

  /// No description provided for @damascus_baramkeh.
  ///
  /// In en, this message translates to:
  /// **'Baramkeh'**
  String get damascus_baramkeh;

  /// No description provided for @damascus_alZahra.
  ///
  /// In en, this message translates to:
  /// **'Al-Zahra'**
  String get damascus_alZahra;

  /// No description provided for @ruralDamascus_douma.
  ///
  /// In en, this message translates to:
  /// **'Douma'**
  String get ruralDamascus_douma;

  /// No description provided for @ruralDamascus_harasta.
  ///
  /// In en, this message translates to:
  /// **'Harasta'**
  String get ruralDamascus_harasta;

  /// No description provided for @ruralDamascus_saidnaya.
  ///
  /// In en, this message translates to:
  /// **'Saidnaya'**
  String get ruralDamascus_saidnaya;

  /// No description provided for @ruralDamascus_zabadani.
  ///
  /// In en, this message translates to:
  /// **'Zabadani'**
  String get ruralDamascus_zabadani;

  /// No description provided for @ruralDamascus_alTall.
  ///
  /// In en, this message translates to:
  /// **'Al-Tall'**
  String get ruralDamascus_alTall;

  /// No description provided for @aleppo_azaz.
  ///
  /// In en, this message translates to:
  /// **'Azaz'**
  String get aleppo_azaz;

  /// No description provided for @aleppo_alBab.
  ///
  /// In en, this message translates to:
  /// **'Al-Bab'**
  String get aleppo_alBab;

  /// No description provided for @aleppo_manbij.
  ///
  /// In en, this message translates to:
  /// **'Manbij'**
  String get aleppo_manbij;

  /// No description provided for @aleppo_jarabulus.
  ///
  /// In en, this message translates to:
  /// **'Jarabulus'**
  String get aleppo_jarabulus;

  /// No description provided for @aleppo_alSukkari.
  ///
  /// In en, this message translates to:
  /// **'Al-Sukkari'**
  String get aleppo_alSukkari;

  /// No description provided for @idlib_maaratAlNuman.
  ///
  /// In en, this message translates to:
  /// **'Maarat al-Numan'**
  String get idlib_maaratAlNuman;

  /// No description provided for @idlib_jisrAlShughur.
  ///
  /// In en, this message translates to:
  /// **'Jisr al-Shughur'**
  String get idlib_jisrAlShughur;

  /// No description provided for @idlib_ariha.
  ///
  /// In en, this message translates to:
  /// **'Ariha'**
  String get idlib_ariha;

  /// No description provided for @idlib_saraqib.
  ///
  /// In en, this message translates to:
  /// **'Saraqib'**
  String get idlib_saraqib;

  /// No description provided for @homs_alRastan.
  ///
  /// In en, this message translates to:
  /// **'Al-Rastan'**
  String get homs_alRastan;

  /// No description provided for @homs_alQusayr.
  ///
  /// In en, this message translates to:
  /// **'Al-Qusayr'**
  String get homs_alQusayr;

  /// No description provided for @homs_talbiseh.
  ///
  /// In en, this message translates to:
  /// **'Talbiseh'**
  String get homs_talbiseh;

  /// No description provided for @homs_tadmur.
  ///
  /// In en, this message translates to:
  /// **'Tadmur'**
  String get homs_tadmur;

  /// No description provided for @hama_masyaf.
  ///
  /// In en, this message translates to:
  /// **'Masyaf'**
  String get hama_masyaf;

  /// No description provided for @hama_salamiyah.
  ///
  /// In en, this message translates to:
  /// **'Salamiyah'**
  String get hama_salamiyah;

  /// No description provided for @hama_mahardah.
  ///
  /// In en, this message translates to:
  /// **'Mahardah'**
  String get hama_mahardah;

  /// No description provided for @hama_suran.
  ///
  /// In en, this message translates to:
  /// **'Suran'**
  String get hama_suran;

  /// No description provided for @latakia_jableh.
  ///
  /// In en, this message translates to:
  /// **'Jableh'**
  String get latakia_jableh;

  /// No description provided for @latakia_qardaha.
  ///
  /// In en, this message translates to:
  /// **'Qardaha'**
  String get latakia_qardaha;

  /// No description provided for @latakia_alHaffah.
  ///
  /// In en, this message translates to:
  /// **'Al-Haffah'**
  String get latakia_alHaffah;

  /// No description provided for @latakia_rabia.
  ///
  /// In en, this message translates to:
  /// **'Rabia'**
  String get latakia_rabia;

  /// No description provided for @tartus_baniyas.
  ///
  /// In en, this message translates to:
  /// **'Baniyas'**
  String get tartus_baniyas;

  /// No description provided for @tartus_safita.
  ///
  /// In en, this message translates to:
  /// **'Safita'**
  String get tartus_safita;

  /// No description provided for @tartus_alShaykhBadr.
  ///
  /// In en, this message translates to:
  /// **'Al-Shaykh Badr'**
  String get tartus_alShaykhBadr;

  /// No description provided for @tartus_duraykish.
  ///
  /// In en, this message translates to:
  /// **'Duraykish'**
  String get tartus_duraykish;

  /// No description provided for @sweidah_shahba.
  ///
  /// In en, this message translates to:
  /// **'Shahba'**
  String get sweidah_shahba;

  /// No description provided for @sweidah_sahwatAlKhudr.
  ///
  /// In en, this message translates to:
  /// **'Sahwat al-Khudr'**
  String get sweidah_sahwatAlKhudr;

  /// No description provided for @sweidah_shaqqa.
  ///
  /// In en, this message translates to:
  /// **'Shaqqa'**
  String get sweidah_shaqqa;

  /// No description provided for @sweidah_rweished.
  ///
  /// In en, this message translates to:
  /// **'Rweished'**
  String get sweidah_rweished;

  /// No description provided for @daraa_dael.
  ///
  /// In en, this message translates to:
  /// **'Da\'el'**
  String get daraa_dael;

  /// No description provided for @daraa_nawa.
  ///
  /// In en, this message translates to:
  /// **'Nawa'**
  String get daraa_nawa;

  /// No description provided for @daraa_izraa.
  ///
  /// In en, this message translates to:
  /// **'Izraa'**
  String get daraa_izraa;

  /// No description provided for @daraa_alShajara.
  ///
  /// In en, this message translates to:
  /// **'Al-Shajara'**
  String get daraa_alShajara;

  /// No description provided for @hassakeh_qamishli.
  ///
  /// In en, this message translates to:
  /// **'Qamishli'**
  String get hassakeh_qamishli;

  /// No description provided for @hassakeh_amuda.
  ///
  /// In en, this message translates to:
  /// **'Amuda'**
  String get hassakeh_amuda;

  /// No description provided for @hassakeh_alMalikiyah.
  ///
  /// In en, this message translates to:
  /// **'Al-Malikiyah'**
  String get hassakeh_alMalikiyah;

  /// No description provided for @hassakeh_rasAlAyn.
  ///
  /// In en, this message translates to:
  /// **'Ras al-Ayn'**
  String get hassakeh_rasAlAyn;

  /// No description provided for @deirAlzoor_alMayadin.
  ///
  /// In en, this message translates to:
  /// **'Al-Mayadin'**
  String get deirAlzoor_alMayadin;

  /// No description provided for @deirAlzoor_alBusayrah.
  ///
  /// In en, this message translates to:
  /// **'Al-Busayrah'**
  String get deirAlzoor_alBusayrah;

  /// No description provided for @deirAlzoor_alShuhayl.
  ///
  /// In en, this message translates to:
  /// **'Al-Shuhayl'**
  String get deirAlzoor_alShuhayl;

  /// No description provided for @deirAlzoor_alKasrah.
  ///
  /// In en, this message translates to:
  /// **'Al-Kasrah'**
  String get deirAlzoor_alKasrah;

  /// No description provided for @alraqqa_alThawrah.
  ///
  /// In en, this message translates to:
  /// **'Al-Thawrah'**
  String get alraqqa_alThawrah;

  /// No description provided for @alraqqa_alMansurah.
  ///
  /// In en, this message translates to:
  /// **'Al-Mansurah'**
  String get alraqqa_alMansurah;

  /// No description provided for @alraqqa_alResafa.
  ///
  /// In en, this message translates to:
  /// **'Al-Resafa'**
  String get alraqqa_alResafa;

  /// No description provided for @alraqqa_alHurriya.
  ///
  /// In en, this message translates to:
  /// **'Al-Hurriya'**
  String get alraqqa_alHurriya;

  /// No description provided for @alQuneitra_fiq.
  ///
  /// In en, this message translates to:
  /// **'Fiq'**
  String get alQuneitra_fiq;

  /// No description provided for @alQuneitra_buqata.
  ///
  /// In en, this message translates to:
  /// **'Buqata'**
  String get alQuneitra_buqata;

  /// No description provided for @alQuneitra_kafrShams.
  ///
  /// In en, this message translates to:
  /// **'Kafr Shams'**
  String get alQuneitra_kafrShams;

  /// No description provided for @discardDialog_title.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get discardDialog_title;

  /// No description provided for @discardDialog_content.
  ///
  /// In en, this message translates to:
  /// **'You will lose all your filters'**
  String get discardDialog_content;

  /// No description provided for @discardDialog_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get discardDialog_cancel;

  /// No description provided for @discardDialog_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get discardDialog_yes;

  /// No description provided for @category_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get category_all;

  /// No description provided for @category_house.
  ///
  /// In en, this message translates to:
  /// **'House'**
  String get category_house;

  /// No description provided for @category_villa.
  ///
  /// In en, this message translates to:
  /// **'Villa'**
  String get category_villa;

  /// No description provided for @category_apartment.
  ///
  /// In en, this message translates to:
  /// **'Apartment'**
  String get category_apartment;

  /// No description provided for @detail_propertyDescription.
  ///
  /// In en, this message translates to:
  /// **'Property Description'**
  String get detail_propertyDescription;

  /// No description provided for @detail_owner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get detail_owner;

  /// No description provided for @detail_cantBookOwnProperty.
  ///
  /// In en, this message translates to:
  /// **'You can\'t book your own property'**
  String get detail_cantBookOwnProperty;

  /// No description provided for @detail_available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get detail_available;

  /// No description provided for @detail_unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get detail_unavailable;

  /// No description provided for @detail_pricePerNight.
  ///
  /// In en, this message translates to:
  /// **'{price}/Night'**
  String detail_pricePerNight(Object price);

  /// No description provided for @read_more.
  ///
  /// In en, this message translates to:
  /// **'ReadMore'**
  String get read_more;

  /// No description provided for @read_less.
  ///
  /// In en, this message translates to:
  /// **'ReadLess'**
  String get read_less;

  /// No description provided for @bathroom.
  ///
  /// In en, this message translates to:
  /// **'Bathroom'**
  String get bathroom;

  /// No description provided for @bedroom.
  ///
  /// In en, this message translates to:
  /// **'Bedroom'**
  String get bedroom;

  /// No description provided for @kitchen.
  ///
  /// In en, this message translates to:
  /// **'Kitchen'**
  String get kitchen;

  /// No description provided for @book_now.
  ///
  /// In en, this message translates to:
  /// **'BookIt Now'**
  String get book_now;

  /// No description provided for @cannot_rate_own_property.
  ///
  /// In en, this message translates to:
  /// **'You can\'t rate your own property'**
  String get cannot_rate_own_property;

  /// No description provided for @rating_success.
  ///
  /// In en, this message translates to:
  /// **'Rating submitted successfully!'**
  String get rating_success;

  /// No description provided for @update_your_rating.
  ///
  /// In en, this message translates to:
  /// **'Update Your Rating'**
  String get update_your_rating;

  /// No description provided for @rate_this_property.
  ///
  /// In en, this message translates to:
  /// **'Rate This Property'**
  String get rate_this_property;

  /// No description provided for @previous_rating_message.
  ///
  /// In en, this message translates to:
  /// **'You previously rated this property {rating} ⭐\nYou can update your rating below.'**
  String previous_rating_message(Object rating);

  /// No description provided for @rate_experience_prompt.
  ///
  /// In en, this message translates to:
  /// **'How would you rate your experience?'**
  String get rate_experience_prompt;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @rating_failed.
  ///
  /// In en, this message translates to:
  /// **'Rating failed'**
  String get rating_failed;

  /// No description provided for @fetchFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch data.'**
  String get fetchFailed;

  /// No description provided for @noProperties.
  ///
  /// In en, this message translates to:
  /// **'No properties found.'**
  String get noProperties;

  /// No description provided for @timeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout. Please try again.'**
  String get timeout;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server error occurred.'**
  String get serverError;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get unexpectedError;

  /// No description provided for @ratingNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'You can’t rate a property you haven’t booked before.'**
  String get ratingNotAllowed;

  /// No description provided for @propertyErrorConnectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout. Please try again.'**
  String get propertyErrorConnectionTimeout;

  /// No description provided for @propertyErrorServerError.
  ///
  /// In en, this message translates to:
  /// **'Server error occurred. Please try again later.'**
  String get propertyErrorServerError;

  /// No description provided for @propertyErrorUnauthorizedRating.
  ///
  /// In en, this message translates to:
  /// **'You cannot rate a property you haven\'t booked before.'**
  String get propertyErrorUnauthorizedRating;

  /// No description provided for @propertyErrorNoPropertiesFound.
  ///
  /// In en, this message translates to:
  /// **'No properties found.'**
  String get propertyErrorNoPropertiesFound;

  /// No description provided for @propertyErrorUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get propertyErrorUnknown;

  /// No description provided for @unit_square_meter.
  ///
  /// In en, this message translates to:
  /// **'m²'**
  String get unit_square_meter;

  /// No description provided for @no_favorites_yet.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get no_favorites_yet;

  /// No description provided for @favourites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favourites;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get something_went_wrong;
}

class _HomeLocalizationsDelegate extends LocalizationsDelegate<HomeLocalizations> {
  const _HomeLocalizationsDelegate();

  @override
  Future<HomeLocalizations> load(Locale locale) {
    return SynchronousFuture<HomeLocalizations>(lookupHomeLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ar'].contains(locale.languageCode);

  @override
  bool shouldReload(_HomeLocalizationsDelegate old) => false;
}

HomeLocalizations lookupHomeLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return HomeLocalizationsEn();
    case 'ar': return HomeLocalizationsAr();
  }

  throw FlutterError(
    'HomeLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
