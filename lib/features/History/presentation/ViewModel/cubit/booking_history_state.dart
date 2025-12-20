import 'package:book_it/features/History/data/model/book_model.dart';

class BookingHistoryState {
  final List<BookModel> ongoing;
  final List<BookModel> completed;
  final List<BookModel> canceled;
  final bool isLoading;
  final String? error;

  const BookingHistoryState({
    required this.ongoing,
    required this.completed,
    required this.canceled,
    required this.isLoading,
    this.error,
  });

  factory BookingHistoryState.initial() {
    return const BookingHistoryState(
      ongoing: [],
      completed: [],
      canceled: [],
      isLoading: false,
      error: null,
    );
  }

  BookingHistoryState copyWith({
    List<BookModel>? ongoing,
    List<BookModel>? completed,
    List<BookModel>? canceled,
    bool? isLoading,
    String? error,
  }) {
    return BookingHistoryState(
      ongoing: ongoing ?? this.ongoing,
      completed: completed ?? this.completed,
      canceled: canceled ?? this.canceled,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
