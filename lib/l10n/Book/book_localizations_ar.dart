// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'book_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class BookLocalizationsAr extends BookLocalizations {
  BookLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get book_confirm_booking => 'تأكيد الحجز';

  @override
  String get book_details_prompt => 'نحتاج إلى بعض التفاصيل لإكمال حجزك.';

  @override
  String get book_start_date => 'تاريخ البدء:';

  @override
  String get book_start_date_hint => 'اختر تاريخ البدء';

  @override
  String get book_end_date => 'تاريخ الانتهاء:';

  @override
  String get book_end_date_hint => 'اختر تاريخ الانتهاء';

  @override
  String get book_billing_address => 'عنوان الفوترة:';

  @override
  String get book_billing_address_hint => 'أدخل عنوان الفوترة';

  @override
  String get book_card_number => 'رقم البطاقة:';

  @override
  String get book_card_number_hint => 'أدخل رقم بطاقة الفوترة';

  @override
  String book_total_price(Object price) {
    return 'السعر الإجمالي: $price\$';
  }

  @override
  String get book_confirm_button => 'تأكيد';

  @override
  String get booking_success_title => 'نجاح';

  @override
  String get booking_success_message => 'تم إرسال طلب الحجز الخاص بك بنجاح';

  @override
  String get booking_success_ok => 'حسناً';

  @override
  String get cardNumberRequired => 'يرجى إدخال رقم بطاقتك';

  @override
  String get cardNumberTooShort => 'يجب أن يكون رقم البطاقة 12 حرفًا على الأقل';

  @override
  String get cardNumberTooLong => 'لا يمكن أن يكون رقم البطاقة أكثر من 19 حرفًا';

  @override
  String get billingAddressRequired => 'يرجى إدخال عنوان الفوترة';

  @override
  String get startDateRequired => 'يرجى إدخال تاريخ البدء';

  @override
  String get endDateRequired => 'يرجى إدخال تاريخ الانتهاء';

  @override
  String get bookErrorCannotBookOwnProperty => 'لا يمكنك حجز عقارك الخاص.';

  @override
  String get bookErrorDateConflict => 'تاريخ الحجز المختار يتعارض مع حجز موجود.';

  @override
  String get bookErrorNetworkError => 'خطأ في الشبكة. يرجى التحقق من الاتصال.';

  @override
  String get bookErrorServerError => 'خطأ في الخادم. يرجى المحاولة لاحقًا.';

  @override
  String get bookErrorUnknown => 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';
}
