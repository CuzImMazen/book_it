import 'package:book_it/core/api/api.dart';
import 'package:dio/dio.dart';

class PropertyService {
  static final PropertyService _instance = PropertyService._internal();
  static PropertyService get instance => _instance;

  PropertyService._internal();
  Dio dio = Api.instance.dio;

  Future<Response> getProperties(Map<String, String> queryParameters) async {
    final response = await dio.get(
      "/properties",
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response> rateProperty(int id, double stars) async {
    final response = await dio.post("/rating/$id", data: {"stars": stars});
    return response;
  }
}
