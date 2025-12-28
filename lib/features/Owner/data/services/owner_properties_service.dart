import 'dart:io';

import 'package:book_it/core/api/api.dart';
import 'package:dio/dio.dart';

class OwnerService {
  final Dio _dio = Api.instance.dio;
  static final OwnerService _instance = OwnerService._internal();

  static OwnerService get instance => _instance;

  OwnerService._internal();

  Future<Response> getOwnerProperties() async {
    return await _dio.get("/owner/token");
  }

  Future<Response> createProperty({
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
    final formData = FormData.fromMap({
      "name": name,
      "description": description,
      "category": category,
      "governorate": governorate,
      "city": city,
      "price_per_day": pricePerDay,
      "area": area,
      "rooms": rooms,
      "bathrooms": bathrooms,
      "kitchens": kitchens,
      "is_available": true,

      "images": [
        for (final image in images)
          await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
          ),
      ],
    });

    return await _dio.post(
      "/property",
      data: formData,
      options: Options(contentType: "multipart/form-data"),
    );
  }
}
