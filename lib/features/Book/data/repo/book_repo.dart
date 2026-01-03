import 'package:book_it/features/Book/data/services/book_service.dart';
import 'package:dio/dio.dart';

enum BookError {
  cannotBookOwnProperty,
  dateConflict,
  networkError,
  serverError,
  unknown,
}

class BookRepo {
  final BookService _bookService = BookService.instance;

  Future<BookError?> createBook({
    required int id,
    required String startDate,
    required String endDate,
    required String cardNumber,
    required String billingAddress,
  }) async {
    try {
      final response = await _bookService.createBook(
        id,
        startDate,
        endDate,
        cardNumber,
        billingAddress,
      );

      if (response.statusCode == 201) return null;

      return BookError.unknown;
    } on DioException catch (e) {
      return _mapDioErrorToBookError(e);
    } catch (_) {
      return BookError.unknown;
    }
  }

  BookError _mapDioErrorToBookError(DioException e) {
    final status = e.response?.statusCode;

    switch (status) {
      case 403:
        return BookError.cannotBookOwnProperty;
      case 422:
        return BookError.dateConflict;
    }

    if (status != null && status >= 500) {
      return BookError.serverError;
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.connectionError) {
      return BookError.networkError;
    }

    return BookError.unknown;
  }
}
