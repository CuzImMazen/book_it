import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Home/data/services/property_service.dart';
import 'package:dio/dio.dart';

class PropertyRepo {
  final PropertyService _propertyService = PropertyService.instance;

  Future<(List<PropertyModel> properties, String? errorMessage)> getProperties(
    Map<String, String> queryParameters,
  ) async {
    try {
      final response = await _propertyService.getProperties(queryParameters);

      if (response.statusCode != 200) {
        return (
          <PropertyModel>[],
          'Failed to fetch properties: ${response.statusCode}',
        );
      }

      final propertiesJson = response.data['properties'] as List<dynamic>?;

      if (propertiesJson == null) {
        return (<PropertyModel>[], 'No properties found.');
      }

      final properties = propertiesJson
          .map((json) => PropertyModel.fromJson(json as Map<String, dynamic>))
          .toList();

      return (properties, null);
    } on DioException catch (dioError) {
      String message;
      if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        message = 'Connection timeout. Please try again.';
      } else if (dioError.type == DioExceptionType.badResponse) {
        message = 'Server error: ${dioError.response?.statusCode}';
      } else {
        message = 'Unexpected error: ${dioError.message}';
      }

      return (<PropertyModel>[], message);
    } catch (e) {
      return (<PropertyModel>[], 'Failed to fetch properties: $e');
    }
  }

  Future<(bool success, String? errorMessage)> rateProperty(
    int propertyId,
    double stars,
  ) async {
    try {
      final response = await _propertyService.rateProperty(propertyId, stars);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return (true, null);
      } else {
        return (false, 'Failed to submit rating: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      String message;

      if (dioError.response?.statusCode == 403) {
        message = 'You can’t rate a property you haven’t booked before.';
      } else if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        message = 'Connection timeout. Please try again.';
      } else if (dioError.type == DioExceptionType.badResponse) {
        message = 'Server error: ${dioError.response?.statusCode}';
      } else {
        message = 'Unexpected error: ${dioError.message}';
      }

      return (false, message);
    } catch (e) {
      return (false, 'Failed to submit rating: $e');
    }
  }
}
