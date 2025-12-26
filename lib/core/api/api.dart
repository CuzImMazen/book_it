import 'package:book_it/core/storage/token/token_storage.dart';
import 'package:dio/dio.dart';
import '../api/base_url.dart';

class Api {
  static final Api _instance = Api._internal();
  static Api get instance => _instance;

  late final Dio dio;

  Api._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: 15),
        receiveTimeout: Duration(seconds: 15),
        sendTimeout: Duration(seconds: 15),
        headers: {'Accept': 'application/json'},
      ),
    );

    _addTokenInterceptor();
  }

  void _addTokenInterceptor() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenStorage.getToken();
          if (options.extra["requiresAuth"] != false && token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );
  }
}
