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
    final formData = FormData();

    formData.fields
      ..add(MapEntry("name", name))
      ..add(MapEntry("description", description))
      ..add(MapEntry("category", category))
      ..add(MapEntry("governorate", governorate))
      ..add(MapEntry("city", city))
      ..add(MapEntry("price_per_day", pricePerDay.toString()))
      ..add(MapEntry("area", area.toString()))
      ..add(MapEntry("rooms", rooms.toString()))
      ..add(MapEntry("bathrooms", bathrooms.toString()))
      ..add(MapEntry("kitchens", kitchens.toString()))
      ..add(MapEntry("is_available", "1"));

    final fileList = await Future.wait(
      images.map(
        (image) => MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      ),
    );

    formData.files.addAll(fileList.map((file) => MapEntry("images[]", file)));

    return await _dio.post(
      "/property",
      data: formData,
      options: Options(contentType: "multipart/form-data"),
    );
  }

  Future<Response> deleteProperty(int id) async {
    return await _dio.delete("/property/$id");
  }
}
