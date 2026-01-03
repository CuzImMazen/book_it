import 'package:book_it/features/History/data/model/book_model.dart';
import 'package:book_it/features/History/data/services/booking_history_service.dart';
import 'package:dio/dio.dart';

enum BookingError {
  failedCurrentBookings,
  failedFutureBookings,
  failedOldBookings,
  failedCanceledBookings,
  failedPendingBookings,
  failedPendingEditBookings,
  failedCancelBooking,
  failedUpdateBooking,
  dateConflict,
  failedAddRating,
  failedEditRating,
  unknown,
}

class BookingHistoryRepo {
  final BookingHistoryService _service = BookingHistoryService.instance;

  Future<(List<BookModel>, BookingError?)> getCurrentBookings() async {
    try {
      final response = await _service.getCurrentBookings();
      final bookingsRaw = response.data['bookings'] as List<dynamic>? ?? [];
      final bookings = bookingsRaw
          .whereType<Map<String, dynamic>>()
          .map((b) => BookModel.fromJson(b, 'Active'))
          .toList();
      return (bookings, null);
    } catch (_) {
      return (<BookModel>[], BookingError.failedCurrentBookings);
    }
  }

  Future<(List<BookModel>, BookingError?)> getFutureBookings() async {
    try {
      final response = await _service.getFutureBookings();
      final bookingsRaw = response.data['bookings'] as List<dynamic>? ?? [];
      final bookings = bookingsRaw
          .whereType<Map<String, dynamic>>()
          .map((b) => BookModel.fromJson(b, 'Upcoming'))
          .toList();
      return (bookings, null);
    } catch (_) {
      return (<BookModel>[], BookingError.failedFutureBookings);
    }
  }

  Future<(List<BookModel>, BookingError?)> getOldBookings() async {
    try {
      final response = await _service.getOldBookings();
      final bookingsRaw = response.data['bookings'] as List<dynamic>? ?? [];
      final bookings = bookingsRaw
          .whereType<Map<String, dynamic>>()
          .map((b) => BookModel.fromJson(b, 'Completed'))
          .toList();
      return (bookings, null);
    } catch (_) {
      return (<BookModel>[], BookingError.failedOldBookings);
    }
  }

  Future<(List<BookModel>, BookingError?)> getCanceledBookings() async {
    try {
      final response = await _service.getCanceledBookings();
      final bookingsRaw = response.data['bookings'] as List<dynamic>? ?? [];
      final bookings = bookingsRaw
          .whereType<Map<String, dynamic>>()
          .map((b) => BookModel.fromJson(b, 'Canceled'))
          .toList();
      return (bookings, null);
    } catch (_) {
      return (<BookModel>[], BookingError.failedCanceledBookings);
    }
  }

  Future<(List<BookModel>, BookingError?)> getPendingBookings() async {
    try {
      final response = await _service.getPendingBookings();
      final bookingsRaw = response.data['bookings'] as List<dynamic>? ?? [];
      final bookings = bookingsRaw
          .whereType<Map<String, dynamic>>()
          .map((b) => BookModel.fromJson(b, 'Pending'))
          .toList();
      return (bookings, null);
    } catch (_) {
      return (<BookModel>[], BookingError.failedPendingBookings);
    }
  }

  Future<(List<BookModel>, BookingError?)> getPendingEditBookings() async {
    try {
      final response = await _service.getPendingEditBookings();
      final bookingsRaw = response.data['bookings'] as List<dynamic>? ?? [];
      final bookings = bookingsRaw
          .whereType<Map<String, dynamic>>()
          .map((b) => BookModel.fromJson(b, 'PendingEdit'))
          .toList();
      return (bookings, null);
    } catch (_) {
      return (<BookModel>[], BookingError.failedPendingEditBookings);
    }
  }

  Future<(bool, BookingError?)> cancelBooking(int id) async {
    try {
      final response = await _service.cancelBooking(id);
      if (response.statusCode == 200) return (true, null);
      return (false, BookingError.failedCancelBooking);
    } catch (_) {
      return (false, BookingError.failedCancelBooking);
    }
  }

  Future<(bool, BookingError?)> updateBooking(
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
      if (response.statusCode == 200) return (true, null);
      return (false, BookingError.failedUpdateBooking);
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        return (false, BookingError.dateConflict);
      }
      return (false, BookingError.failedUpdateBooking);
    } catch (_) {
      return (false, BookingError.failedUpdateBooking);
    }
  }

  Future<(bool, BookingError?)> addRating(
    int id,
    int stars,
    String? comment,
  ) async {
    try {
      final response = await _service.addRating(
        id: id,
        stars: stars,
        comment: comment,
      );
      if (response.statusCode == 200 || response.statusCode == 201)
        return (true, null);
      return (false, BookingError.failedAddRating);
    } catch (_) {
      return (false, BookingError.failedAddRating);
    }
  }

  Future<(bool, BookingError?)> editRating(
    int id,
    int stars,
    String? comment,
  ) async {
    try {
      final response = await _service.editRating(
        id: id,
        stars: stars,
        comment: comment,
      );
      if (response.statusCode == 200 || response.statusCode == 201)
        return (true, null);
      return (false, BookingError.failedEditRating);
    } catch (_) {
      return (false, BookingError.failedEditRating);
    }
  }
}
