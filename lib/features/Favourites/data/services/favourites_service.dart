import 'package:book_it/core/api/api.dart';
import 'package:dio/dio.dart';

class FavouritesService {
  static final FavouritesService _instance = FavouritesService._internal();
  static FavouritesService get instance => _instance;
  FavouritesService._internal();

  final Dio _dio = Api.instance.dio;

  Future<Response> getFavourites() async {
    Response response = await _dio.get("/favorites");
    return response;
  }

  Future<Response> toggleFavourite(int id) async {
    Response response = await _dio.post("/favorites/$id/toggle");
    return response;
  }
}
