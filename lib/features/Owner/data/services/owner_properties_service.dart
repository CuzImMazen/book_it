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
}
