import 'package:book_it/core/api/api.dart';
import 'package:dio/dio.dart';

class BookingHistoryService {
  static final BookingHistoryService _instance =
      BookingHistoryService._internal();

  static BookingHistoryService get instance => _instance;

  BookingHistoryService._internal();
  final Dio _dio = Api.instance.dio;

  Future<Response> getAllBookings() async {
    return await _dio.get("/bookings");
  }

  Future<Response> getCurrentBookings() async {
    return await _dio.get("/bookings/current");
  }

  Future<Response> getFutureBookings() async {
    return await _dio.get("/bookings/future");
  }

  Future<Response> getOldBookings() async {
    return await _dio.get("/bookings/old");
  }

  Future<Response> getCanceledBookings() async {
    return await _dio.get("/bookings/cancelled");
  }

  Future<Response> getOnGoingBookings() async {
    return await _dio.get("/bookings/current/future");
  }

  Future<Response> cancelBooking(int id) async {
    return await _dio.delete("/booking/$id");
  }

  Future<Response> getPendingBookings() async {
    return await _dio.get("/user/bookings/pending");
  }

  Future<Response> getPendingEditBookings() async {
    return await _dio.get("/user/bookings/pending_edit");
  }

  Future<Response> editBooking({
    required int id,
    String? startDate,
    required String endDate,
  }) async {
    final data = <String, dynamic>{'end_date': endDate};

    if (startDate != null) {
      data['start_date'] = startDate;
    }

    return await _dio.put("/booking/$id", data: data);
  }
}
