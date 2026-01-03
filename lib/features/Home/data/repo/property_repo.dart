import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Home/data/services/property_service.dart';
import 'package:dio/dio.dart';

enum PropertyError {
  connectionTimeout,
  serverError,
  unauthorizedRating,
  noPropertiesFound,
  unknown,
}

class PropertyRepo {
  final PropertyService _propertyService = PropertyService.instance;

  Future<(List<PropertyModel> properties, PropertyError? error)> getProperties(
    Map<String, String> queryParameters,
  ) async {
    try {
      final response = await _propertyService.getProperties(queryParameters);

      if (response.statusCode != 200) {
        return (<PropertyModel>[], PropertyError.serverError);
      }

      final propertiesJson = response.data['properties'] as List<dynamic>?;

      if (propertiesJson == null || propertiesJson.isEmpty) {
        return (<PropertyModel>[], PropertyError.noPropertiesFound);
      }

      final properties = propertiesJson
          .map((json) => PropertyModel.fromJson(json as Map<String, dynamic>))
          .toList();

      return (properties, null);
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        return (<PropertyModel>[], PropertyError.connectionTimeout);
      }
      if (dioError.type == DioExceptionType.badResponse) {
        return (<PropertyModel>[], PropertyError.serverError);
      }
      return (<PropertyModel>[], PropertyError.unknown);
    } catch (_) {
      return (<PropertyModel>[], PropertyError.unknown);
    }
  }

  Future<(bool success, PropertyError? error)> rateProperty(
    int propertyId,
    double stars,
  ) async {
    try {
      final response = await _propertyService.rateProperty(propertyId, stars);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return (true, null);
      }

      return (false, PropertyError.unknown);
    } on DioException catch (dioError) {
      if (dioError.response?.statusCode == 403) {
        return (false, PropertyError.unauthorizedRating);
      }
      if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        return (false, PropertyError.connectionTimeout);
      }
      if (dioError.type == DioExceptionType.badResponse) {
        return (false, PropertyError.serverError);
      }
      return (false, PropertyError.unknown);
    } catch (_) {
      return (false, PropertyError.unknown);
    }
  }
}
