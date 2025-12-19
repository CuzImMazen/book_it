import 'package:book_it/features/Book/data/services/book_service.dart';
import 'package:dio/dio.dart';

class BookRepo {
  final BookService _bookService = BookService.instance;

  Future<String?> createBook(
    int id,
    String startDate,
    String endDate,
    String cardNumber,
    String billingAddress,
  ) async {
    try {
      final response = await _bookService.createBook(
        id,
        startDate,
        endDate,
        cardNumber,
        billingAddress,
      );
      if (response.statusCode == 201) {
        return null;
      }
      return "Unexpected status code: ${response.statusCode}";
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 422) {
        return e.response!.data["message"];
      }
      return "Unexpected error: ${e.response?.statusCode ?? "Network or server error"}";
    } catch (e) {
      return "Network or server error: $e";
    }
  }
}
