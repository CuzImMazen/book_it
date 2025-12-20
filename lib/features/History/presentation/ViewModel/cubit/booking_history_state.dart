import 'package:book_it/features/History/data/model/book_model.dart';

class BookingHistoryState {
  final List<BookModel> ongoing;
  final List<BookModel> completed;
  final List<BookModel> canceled;

  final bool isLoadingOngoing;
  final bool isLoadingCompleted;
  final bool isLoadingCanceled;

  final String? errorOngoing;
  final String? errorCompleted;
  final String? errorCanceled;

  const BookingHistoryState({
    required this.ongoing,
    required this.completed,
    required this.canceled,
    required this.isLoadingOngoing,
    required this.isLoadingCompleted,
    required this.isLoadingCanceled,
    this.errorOngoing,
    this.errorCompleted,
    this.errorCanceled,
  });

  factory BookingHistoryState.initial() {
    return const BookingHistoryState(
      ongoing: [],
      completed: [],
      canceled: [],
      isLoadingOngoing: false,
      isLoadingCompleted: false,
      isLoadingCanceled: false,
      errorOngoing: null,
      errorCompleted: null,
      errorCanceled: null,
    );
  }

  BookingHistoryState copyWith({
    List<BookModel>? ongoing,
    List<BookModel>? completed,
    List<BookModel>? canceled,
    bool? isLoadingOngoing,
    bool? isLoadingCompleted,
    bool? isLoadingCanceled,
    String? errorOngoing,
    String? errorCompleted,
    String? errorCanceled,
  }) {
    return BookingHistoryState(
      ongoing: ongoing ?? this.ongoing,
      completed: completed ?? this.completed,
      canceled: canceled ?? this.canceled,
      isLoadingOngoing: isLoadingOngoing ?? this.isLoadingOngoing,
      isLoadingCompleted: isLoadingCompleted ?? this.isLoadingCompleted,
      isLoadingCanceled: isLoadingCanceled ?? this.isLoadingCanceled,
      errorOngoing: errorOngoing,
      errorCompleted: errorCompleted,
      errorCanceled: errorCanceled,
    );
  }
}
