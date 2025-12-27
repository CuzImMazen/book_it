import 'package:book_it/features/Owner/data/models/pending_booking.dart';
import 'package:book_it/features/Owner/data/services/owner_requests_service.dart';
import 'package:dio/dio.dart';

class OwnerRequestsRepo {
  final OwnerRequestsService _ownerRequestsService =
      OwnerRequestsService.instance;

  Future<(List<PendingBookingModel> pendingBookings, String? errorMessage)>
  getPendingRequests() async {
    try {
      final response = await _ownerRequestsService.getBookingRequests();
      if (response.statusCode != 200) {
        return (
          <PendingBookingModel>[],
          "Failed to fetch bookings: ${response.statusCode}",
        );
      }
      final propertiesJson = response.data['bookings'] as List<dynamic>?;
      if (propertiesJson == null) {
        return (<PendingBookingModel>[], "No bookings found.");
      }
      final properties = propertiesJson
          .map(
            (json) =>
                PendingBookingModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();

      return (properties, null);
    } on DioException catch (dioError) {
      String message;
      if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        message = "Connection timeout. Please try again.";
      } else if (dioError.type == DioExceptionType.badResponse) {
        message = "Server error: ${dioError.response?.statusCode}";
      } else {
        message = "Unexpected error: ${dioError.message}";
      }

      return (<PendingBookingModel>[], message);
    } catch (e) {
      return (<PendingBookingModel>[], "Failed to fetch Pending Bookings: $e");
    }
  }

  Future<(bool, String?)> acceptBookingRequest(int id) async {
    try {
      final response = await _ownerRequestsService.acceptBookingRequest(id);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return (true, "Booking request accepted successfully");
      }

      return (false, "Failed to accept booking request");
    } on DioException catch (dioError) {
      if (dioError.response?.statusCode == 422) {
        return (false, "Booking cant be Accepted due to date conflict");
      }
      if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        return (false, "Connection timeout. Please try again.");
      } else if (dioError.type == DioExceptionType.badResponse) {
        return (false, "Server error: ${dioError.response?.statusCode}");
      } else {
        return (false, "Unexpected error: ${dioError.message}");
      }
    } catch (e) {
      return (false, "Failed to accept booking request ");
    }
  }

  Future<(bool, String?)> rejectBookingRequest(int id) async {
    try {
      final response = await _ownerRequestsService.rejectBookingRequest(id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (true, "Booking request rejected successfully");
      }
      return (false, "Failed to reject booking request");
    } catch (e) {
      return (false, "Failed to reject booking request ");
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////
  Future<(List<PendingBookingModel> pendingBookings, String? errorMessage)>
  getPendingModificationRequests() async {
    try {
      final response = await _ownerRequestsService.getModificationRequests();
      if (response.statusCode != 200) {
        return (
          <PendingBookingModel>[],
          "Failed to fetch bookings: ${response.statusCode}",
        );
      }
      final propertiesJson = response.data['bookings'] as List<dynamic>?;
      if (propertiesJson == null) {
        return (<PendingBookingModel>[], "No bookings found.");
      }
      final properties = propertiesJson
          .map(
            (json) =>
                PendingBookingModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();

      return (properties, null);
    } on DioException catch (dioError) {
      String message;
      if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        message = "Connection timeout. Please try again.";
      } else if (dioError.type == DioExceptionType.badResponse) {
        message = "Server error: ${dioError.response?.statusCode}";
      } else {
        message = "Unexpected error: ${dioError.message}";
      }

      return (<PendingBookingModel>[], message);
    } catch (e) {
      return (<PendingBookingModel>[], "Failed to fetch Pending Bookings: $e");
    }
  }

  Future<(bool, String?)> acceptModificationRequest(int id) async {
    try {
      final response = await _ownerRequestsService.acceptModificationRequest(
        id,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return (true, "Modification request accepted successfully");
      }

      return (false, "Failed to accept modification request");
    } on DioException catch (dioError) {
      if (dioError.response?.statusCode == 422) {
        return (false, "Modification cant be Accepted due to date conflict");
      }
      if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        return (false, "Connection timeout. Please try again.");
      } else if (dioError.type == DioExceptionType.badResponse) {
        return (false, "Server error: ${dioError.response?.statusCode}");
      } else {
        return (false, "Unexpected error: ${dioError.message}");
      }
    } catch (e) {
      return (false, "Failed to accept modification request ");
    }
  }

  Future<(bool, String?)> rejectModificationRequest(int id) async {
    try {
      final response = await _ownerRequestsService.rejectModificationRequest(
        id,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (true, "Modification request rejected successfully");
      }
      return (false, "Failed to reject modification request");
    } catch (e) {
      return (false, "Failed to reject modification request ");
    }
  }
}
