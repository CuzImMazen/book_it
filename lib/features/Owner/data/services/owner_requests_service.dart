import 'package:book_it/core/api/api.dart';
import 'package:dio/dio.dart';

class OwnerRequestsService {
  final Dio _dio = Api.instance.dio;
  static final OwnerRequestsService _instance =
      OwnerRequestsService._internal();

  static OwnerRequestsService get instance => _instance;

  OwnerRequestsService._internal();

  Future<Response> getBookingRequests() async {
    return await _dio.get("/owner/properties/pendingBookings");
  }

  Future<Response> acceptBookingRequest(int id) async {
    return await _dio.post("/owner/properties/bookings/$id/accept");
  }

  Future<Response> rejectBookingRequest(int id) async {
    return await _dio.post("/owner/properties/bookings/$id/reject");
  }
}
