import 'package:book_it/core/api/api.dart';
import 'package:dio/dio.dart';

class BookService {
  static final BookService _instance = BookService._internal();
  static BookService get instance => _instance;
  BookService._internal();

  final Dio _dio = Api.instance.dio;
  Future<Response> createBook(
    int id,
    String startDate,
    String endDate,
    String cardNumber,
    String billingAddress,
  ) async {
    Response response = await _dio.post(
      "/booking/property/$id",
      data: {
        "start_date": startDate,
        "end_date": endDate,
        "card_number": cardNumber,
        "billing_address": billingAddress,
      },
    );
    return response;
  }
}
