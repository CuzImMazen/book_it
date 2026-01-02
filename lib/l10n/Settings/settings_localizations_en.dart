// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'settings_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SettingsLocalizationsEn extends SettingsLocalizations {
  SettingsLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get settings_title => 'Settings';

  @override
  String get settings_dark_mode => 'Dark Mode';

  @override
  String get settings_language => 'Language';

  @override
  String get settings_my_properties => 'My Properties';

  @override
  String get settings_logout => 'Logout';

  @override
  String get settings_logout_success => 'You logged out successfully';

  @override
  String get settings_cant_access_owner_feature => 'You can\'t access this feature';

  @override
  String get error_create_owner_account => 'Please create an owner account and try again.';
}
