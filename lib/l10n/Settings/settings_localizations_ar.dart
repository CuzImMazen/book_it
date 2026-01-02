// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'settings_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class SettingsLocalizationsAr extends SettingsLocalizations {
  SettingsLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get settings_title => 'الإعدادات';

  @override
  String get settings_dark_mode => 'الوضع الداكن';

  @override
  String get settings_language => 'اللغة';

  @override
  String get settings_my_properties => 'عقاراتي';

  @override
  String get settings_logout => 'تسجيل الخروج';

  @override
  String get settings_logout_success => 'تم تسجيل الخروج بنجاح';

  @override
  String get settings_cant_access_owner_feature => 'لا يمكنك الوصول إلى هذه الميزة';

  @override
  String get error_create_owner_account => 'يرجى إنشاء حساب مالك والمحاولة مرة أخرى';
}
