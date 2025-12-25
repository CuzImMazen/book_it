import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Owner/data/services/owner_service.dart';
import 'package:dio/dio.dart';

class OwnerRepo {
  final OwnerService _ownerService = OwnerService.instance;

  Future<(List<PropertyModel> properties, String? errorMessage)>
  getOwnerProperties() async {
    try {
      final response = await _ownerService.getOwnerProperties();
      if (response.statusCode != 200) {
        return (
          <PropertyModel>[],
          "Failed to fetch properties: ${response.statusCode}",
        );
      }
      final propertiesJson = response.data['properties'] as List<dynamic>?;
      if (propertiesJson == null) {
        return (<PropertyModel>[], "No properties found.");
      }
      final properties = propertiesJson
          .map((json) => PropertyModel.fromJson(json as Map<String, dynamic>))
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

      return (<PropertyModel>[], message);
    } catch (e) {
      return (<PropertyModel>[], "Failed to fetch properties: $e");
    }
  }
}
