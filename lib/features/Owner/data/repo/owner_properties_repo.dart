import 'dart:io';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Owner/data/services/owner_properties_service.dart';
import 'package:dio/dio.dart';

enum OwnerPropertyError {
  connectionTimeout,
  serverError,
  failedCreateProperty,
  failedDeleteProperty,
  noPropertiesFound,
  unknown,
}

class OwnerPropertiesRepo {
  final OwnerService _ownerService = OwnerService.instance;

  Future<(List<PropertyModel> properties, OwnerPropertyError? error)>
  getOwnerProperties() async {
    try {
      final response = await _ownerService.getOwnerProperties();

      if (response.statusCode != 200) {
        return (<PropertyModel>[], OwnerPropertyError.serverError);
      }

      final propertiesJson = response.data['properties'] as List<dynamic>?;

      if (propertiesJson == null || propertiesJson.isEmpty) {
        return (<PropertyModel>[], OwnerPropertyError.noPropertiesFound);
      }

      final properties = propertiesJson
          .map((json) => PropertyModel.fromJson(json as Map<String, dynamic>))
          .toList();

      return (properties, null);
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        return (<PropertyModel>[], OwnerPropertyError.connectionTimeout);
      }
      if (dioError.type == DioExceptionType.badResponse) {
        return (<PropertyModel>[], OwnerPropertyError.serverError);
      }
      return (<PropertyModel>[], OwnerPropertyError.unknown);
    } catch (_) {
      return (<PropertyModel>[], OwnerPropertyError.unknown);
    }
  }

  Future<OwnerPropertyError?> createProperty({
    required String name,
    required String description,
    required String category,
    required String governorate,
    required String city,
    required int pricePerDay,
    required int area,
    required int rooms,
    required int bathrooms,
    required int kitchens,
    required List<File> images,
  }) async {
    try {
      final response = await _ownerService.createProperty(
        name: name,
        description: description,
        category: category,
        governorate: governorate,
        city: city,
        pricePerDay: pricePerDay,
        area: area,
        rooms: rooms,
        bathrooms: bathrooms,
        kitchens: kitchens,
        images: images,
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        return OwnerPropertyError.failedCreateProperty;
      }

      return null;
    } on DioException catch (_) {
      return OwnerPropertyError.failedCreateProperty;
    } catch (_) {
      return OwnerPropertyError.failedCreateProperty;
    }
  }

  Future<OwnerPropertyError?> deleteProperty(int propertyId) async {
    try {
      final response = await _ownerService.deleteProperty(propertyId);

      if (response.statusCode != 200) {
        return OwnerPropertyError.failedDeleteProperty;
      }

      return null;
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        return OwnerPropertyError.connectionTimeout;
      }
      if (dioError.type == DioExceptionType.badResponse) {
        return OwnerPropertyError.serverError;
      }
      return OwnerPropertyError.unknown;
    } catch (_) {
      return OwnerPropertyError.unknown;
    }
  }
}
