// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'history_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class HistoryLocalizationsAr extends HistoryLocalizations {
  HistoryLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get history_booking_history => 'سجل الحجوزات';

  @override
  String get history_tab_ongoing => 'جاري';

  @override
  String get history_tab_completed => 'مكتمل';

  @override
  String get history_tab_canceled => 'ملغى';

  @override
  String get history_no_ongoing_bookings => 'لا توجد حجوزات جارية';

  @override
  String get history_no_completed_bookings => 'لا توجد حجوزات مكتملة';

  @override
  String get history_no_canceled_bookings => 'لا توجد حجوزات ملغاة';

  @override
  String get editBooking_start_date => 'تاريخ البداية';

  @override
  String get editBooking_end_date => 'تاريخ النهاية';

  @override
  String get editBooking_select_start_date_hint => 'اختر تاريخ البداية';

  @override
  String get editBooking_select_end_date_hint => 'اختر تاريخ النهاية';

  @override
  String get editBooking_enter_end_date_hint => 'أدخل تاريخ النهاية';

  @override
  String get editBooking_confirm_button => 'تأكيد';

  @override
  String get editBooking_no_changes_message => 'لم تغير أي شيء';

  @override
  String price_per_night(Object price) {
    return '$price/ليلة';
  }

  @override
  String get editBooking_title => 'تعديل الحجز';

  @override
  String get editBooking_upcomingSuccess => 'تم إرسال طلب تعديل الحجز إلى المالك';

  @override
  String get editBooking_activeSuccess => 'تم إرسال طلب تحديث الحجز إلى المالك';

  @override
  String get cancelBooking_title => 'إلغاء الحجز';

  @override
  String get cancelBooking_message => 'هل أنت متأكد أنك تريد إلغاء هذا الحجز؟';

  @override
  String get cancelBooking_no => 'لا';

  @override
  String get cancelBooking_confirm => 'إلغاء الحجز';

  @override
  String get bookingErrorFailedCurrentBookings => 'فشل في تحميل الحجوزات الحالية';

  @override
  String get bookingErrorFailedFutureBookings => 'فشل في تحميل الحجوزات القادمة';

  @override
  String get bookingErrorFailedOldBookings => 'فشل في تحميل الحجوزات السابقة';

  @override
  String get bookingErrorFailedCanceledBookings => 'فشل في تحميل الحجوزات الملغاة';

  @override
  String get bookingErrorFailedPendingBookings => 'فشل في تحميل الحجوزات المعلقة';

  @override
  String get bookingErrorFailedPendingEditBookings => 'فشل في تحميل الحجوزات المعلقة للتعديل';

  @override
  String get bookingErrorFailedCancelBooking => 'فشل في إلغاء الحجز';

  @override
  String get bookingErrorFailedUpdateBooking => 'فشل في تحديث الحجز';

  @override
  String get bookingErrorDateConflict => 'لا يمكن تحديث الحجز بسبب تعارض التواريخ';

  @override
  String get bookingErrorFailedAddRating => 'فشل في إضافة التقييم';

  @override
  String get bookingErrorFailedEditRating => 'فشل في تعديل التقييم';

  @override
  String get bookingErrorUnknown => 'حدث خطأ غير متوقع';

  @override
  String get status_canceled => 'ملغى';

  @override
  String get status_completed => 'مكتمل';

  @override
  String get status_active => 'نشط';

  @override
  String get status_pending => 'قيد الانتظار';

  @override
  String get status_edit => 'قيد انتظار التعديل';

  @override
  String get status_upcoming => 'قادم';
}
