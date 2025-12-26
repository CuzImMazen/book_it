import 'package:book_it/features/History/data/model/book_model.dart';
import 'package:book_it/features/History/data/services/booking_history_service.dart';
import 'package:dio/dio.dart';

class BookingHistoryRepo {
  final BookingHistoryService _service = BookingHistoryService.instance;

  Future<(List<BookModel>, String?)> getCurrentBookings() async {
    try {
      final response = await _service.getCurrentBookings();
      final bookingsRaw = response.data['bookings'] as List<dynamic>? ?? [];
      final bookings = bookingsRaw
          .whereType<Map<String, dynamic>>()
          .map((b) => BookModel.fromJson(b, 'Active'))
          .toList();
      return (bookings, null);
    } catch (e) {
      return (<BookModel>[], "Failed to get current bookings ");
    }
  }

  Future<(List<BookModel>, String?)> getFutureBookings() async {
    try {
      final response = await _service.getFutureBookings();
      final bookingsRaw = response.data['bookings'] as List<dynamic>? ?? [];
      final bookings = bookingsRaw
          .whereType<Map<String, dynamic>>()
          .map((b) => BookModel.fromJson(b, 'Upcoming'))
          .toList();
      return (bookings, null);
    } catch (e) {
      return (
        <BookModel>[],
        "Failed to get upcoming bookings please try again later",
      );
    }
  }

  Future<(List<BookModel>, String?)> getOldBookings() async {
    try {
      final response = await _service.getOldBookings();
      final bookingsRaw = response.data['bookings'] as List<dynamic>? ?? [];
      final bookings = bookingsRaw
          .whereType<Map<String, dynamic>>()
          .map((b) => BookModel.fromJson(b, 'Completed'))
          .toList();
      return (bookings, null);
    } catch (e) {
      return (
        <BookModel>[],
        "Failed to get past bookings please try again later",
      );
    }
  }

  Future<(List<BookModel>, String?)> getCanceledBookings() async {
    try {
      final response = await _service.getCanceledBookings();
      final bookingsRaw = response.data['bookings'] as List<dynamic>? ?? [];
      final bookings = bookingsRaw
          .whereType<Map<String, dynamic>>()
          .map((b) => BookModel.fromJson(b, 'Canceled'))
          .toList();
      return (bookings, null);
    } catch (e) {
      return (
        <BookModel>[],
        "Failed to get canceled bookings please try again later",
      );
    }
  }

  Future<(List<BookModel>, String?)> getPendingBookings() async {
    try {
      final response = await _service.getPendingBookings();
      final bookingsRaw = response.data['bookings'] as List<dynamic>? ?? [];
      final bookings = bookingsRaw
          .whereType<Map<String, dynamic>>()
          .map((b) => BookModel.fromJson(b, 'Pending'))
          .toList();
      return (bookings, null);
    } catch (e) {
      print(e.toString());
      return (
        <BookModel>[],
        "Failed to get Pending bookings please try again later",
      );
    }
  }

  Future<(List<BookModel>, String?)> getPendingEditBookings() async {
    try {
      final response = await _service.getPendingEditBookings();
      final bookingsRaw = response.data['bookings'] as List<dynamic>? ?? [];
      final bookings = bookingsRaw
          .whereType<Map<String, dynamic>>()
          .map((b) => BookModel.fromJson2(b, 'PendingEdit'))
          .toList();
      return (bookings, null);
    } catch (e) {
      return (
        <BookModel>[],
        "Failed to get Pending edit bookings please try again later",
      );
    }
  }

  Future<(bool, String?)> cancelBooking(int id) async {
    try {
      final response = await _service.cancelBooking(id);
      if (response.statusCode == 200) {
        return (true, null);
      }
      return (false, "Failed to cancel booking");
    } catch (e) {
      return (false, "Failed to cancel booking ");
    }
  }

  Future<(bool, String?)> updateBooking(
    int id,
    String? startDate,
    String endDate,
  ) async {
    try {
      final response = await _service.editBooking(
        id: id,
        startDate: startDate,
        endDate: endDate,
      );
      if (response.statusCode == 200) {
        return (true, null);
      }
      return (false, "Failed to update booking");
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        return (false, "Cant update booking, due to Dates conflict");
      }
      return (false, "Failed to update booking");
    } catch (e) {
      return (false, "Failed to update booking");
    }
  }
}
