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
  final String? errorPending;
  final String? errorPendingEdit;

  final Set<int> cancelingIds;
  final String? cancelError;

  const BookingHistoryState({
    required this.ongoing,
    required this.completed,
    required this.canceled,

    required this.isLoadingOngoing,
    required this.isLoadingCompleted,
    required this.isLoadingCanceled,
    required this.cancelingIds,
    this.cancelError,
    this.errorOngoing,
    this.errorCompleted,
    this.errorCanceled,
    this.errorPending,
    this.errorPendingEdit,
  });

  factory BookingHistoryState.initial() {
    return const BookingHistoryState(
      ongoing: [],
      completed: [],
      canceled: [],

      cancelingIds: {},
      isLoadingOngoing: false,
      isLoadingCompleted: false,
      isLoadingCanceled: false,
      errorOngoing: null,
      errorCompleted: null,
      errorCanceled: null,
      cancelError: null,
    );
  }

  BookingHistoryState copyWith({
    List<BookModel>? ongoing,
    List<BookModel>? completed,
    List<BookModel>? canceled,
    Set<int>? cancelingIds,
    bool? isLoadingOngoing,
    bool? isLoadingCompleted,
    bool? isLoadingCanceled,
    String? errorOngoing,
    String? errorCompleted,
    String? errorCanceled,
    String? cancelError,
  }) {
    return BookingHistoryState(
      ongoing: ongoing ?? this.ongoing,
      completed: completed ?? this.completed,
      canceled: canceled ?? this.canceled,

      cancelingIds: cancelingIds ?? this.cancelingIds,
      isLoadingOngoing: isLoadingOngoing ?? this.isLoadingOngoing,
      isLoadingCompleted: isLoadingCompleted ?? this.isLoadingCompleted,
      isLoadingCanceled: isLoadingCanceled ?? this.isLoadingCanceled,
      errorOngoing: errorOngoing,
      errorCompleted: errorCompleted,
      errorCanceled: errorCanceled,
      cancelError: cancelError,
    );
  }
}
