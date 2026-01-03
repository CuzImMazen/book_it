import 'package:book_it/features/History/data/model/book_model.dart';
import 'package:book_it/features/History/data/repo/booking_history_repo.dart';

class BookingHistoryState {
  final List<BookModel> ongoing;
  final List<BookModel> completed;
  final List<BookModel> canceled;

  final bool isLoadingOngoing;
  final bool isLoadingCompleted;
  final bool isLoadingCanceled;

  final BookingError? errorOngoing;
  final BookingError? errorCompleted;
  final BookingError? errorCanceled;

  final Set<int> cancelingIds;
  final BookingError? cancelError;

  final Set<int> editingIds;
  final BookingError? editError;

  const BookingHistoryState({
    required this.ongoing,
    required this.completed,
    required this.canceled,
    required this.isLoadingOngoing,
    required this.isLoadingCompleted,
    required this.isLoadingCanceled,
    required this.cancelingIds,
    required this.editingIds,
    this.errorOngoing,
    this.errorCompleted,
    this.errorCanceled,
    this.cancelError,
    this.editError,
  });

  factory BookingHistoryState.initial() {
    return const BookingHistoryState(
      ongoing: [],
      completed: [],
      canceled: [],
      isLoadingOngoing: false,
      isLoadingCompleted: false,
      isLoadingCanceled: false,
      cancelingIds: {},
      editingIds: {},
      errorOngoing: null,
      errorCompleted: null,
      errorCanceled: null,
      cancelError: null,
      editError: null,
    );
  }

  BookingHistoryState copyWith({
    List<BookModel>? ongoing,
    List<BookModel>? completed,
    List<BookModel>? canceled,
    Set<int>? cancelingIds,
    Set<int>? editingIds,
    bool? isLoadingOngoing,
    bool? isLoadingCompleted,
    bool? isLoadingCanceled,
    BookingError? errorOngoing,
    BookingError? errorCompleted,
    BookingError? errorCanceled,
    BookingError? cancelError,
    BookingError? editError,
  }) {
    return BookingHistoryState(
      ongoing: ongoing ?? this.ongoing,
      completed: completed ?? this.completed,
      canceled: canceled ?? this.canceled,
      cancelingIds: cancelingIds ?? this.cancelingIds,
      editingIds: editingIds ?? this.editingIds,
      isLoadingOngoing: isLoadingOngoing ?? this.isLoadingOngoing,
      isLoadingCompleted: isLoadingCompleted ?? this.isLoadingCompleted,
      isLoadingCanceled: isLoadingCanceled ?? this.isLoadingCanceled,
      errorOngoing: errorOngoing,
      errorCompleted: errorCompleted,
      errorCanceled: errorCanceled,
      cancelError: cancelError,
      editError: editError,
    );
  }
}
