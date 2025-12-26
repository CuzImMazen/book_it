import 'package:bloc/bloc.dart';
import 'package:book_it/features/History/data/model/book_model.dart';
import 'package:book_it/features/History/data/repo/booking_history_repo.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_state.dart';

class BookingHistoryCubit extends Cubit<BookingHistoryState> {
  final BookingHistoryRepo repository;

  BookingHistoryCubit(this.repository) : super(BookingHistoryState.initial());

  Future<void> fetchOngoingBookings() async {
    emit(state.copyWith(isLoadingOngoing: true, errorOngoing: null));

    final results = await Future.wait([
      repository.getCurrentBookings(),
      repository.getFutureBookings(),
      repository.getPendingEditBookings(),
      repository.getPendingBookings(),
    ]);

    final current = results[0];
    final future = results[1];
    final pendingEdit = results[2];
    final pending = results[3];

    final merged = [
      ...current.$1,
      ...future.$1,
      ...pendingEdit.$1,
      ...pending.$1,
    ];

    final errorMessages = [
      current.$2,
      future.$2,
      pendingEdit.$2,
      pending.$2,
    ].where((e) => e != null && e.isNotEmpty).join("\n");

    emit(
      state.copyWith(
        ongoing: merged,
        isLoadingOngoing: false,
        errorOngoing: errorMessages.isEmpty ? null : errorMessages,
      ),
    );
  }

  Future<void> fetchPastBookings() async {
    emit(state.copyWith(isLoadingCompleted: true, errorCompleted: null));

    final pastResult = await repository.getOldBookings();

    emit(
      state.copyWith(
        completed: pastResult.$1,
        isLoadingCompleted: false,
        errorCompleted: pastResult.$2,
      ),
    );
  }

  Future<void> fetchCanceledBookings() async {
    emit(state.copyWith(isLoadingCanceled: true, errorCanceled: null));

    final canceledResult = await repository.getCanceledBookings();

    emit(
      state.copyWith(
        canceled: canceledResult.$1,
        isLoadingCanceled: false,
        errorCanceled: canceledResult.$2,
      ),
    );
  }

  Future<void> cancelBooking(BookModel booking) async {
    emit(
      state.copyWith(
        ongoing: state.ongoing.where((b) => b.id != booking.id).toList(),
        cancelingIds: {...state.cancelingIds, booking.id},
        cancelError: null,
      ),
    );

    final (success, error) = await repository.cancelBooking(booking.id);

    if (!success) {
      emit(
        state.copyWith(
          ongoing: [...state.ongoing, booking],
          cancelingIds: state.cancelingIds
              .where((id) => id != booking.id)
              .toSet(),
          cancelError: error,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        canceled: [
          booking.copyWith(status: 'Canceled'),
          ...state.canceled,
        ],
        cancelingIds: state.cancelingIds
            .where((id) => id != booking.id)
            .toSet(),
      ),
    );
  }

  void reset() {
    emit(BookingHistoryState.initial());
  }

  Future<void> editBooking({
    required BookModel booking,
    String? startDate,
    required String endDate,
  }) async {
    emit(
      state.copyWith(
        editingIds: {...state.editingIds, booking.id},
        editError: null,
      ),
    );

    final (success, error) = await repository.updateBooking(
      booking.id,
      startDate,
      endDate,
    );

    final updatedEditingIds = state.editingIds..remove(booking.id);

    if (!success) {
      emit(state.copyWith(editingIds: updatedEditingIds, editError: error));
      return;
    }

    final updatedBooking = booking.copyWith(
      startDate: startDate ?? booking.startDate,
      endDate: endDate,
      status: 'PendingEdit',
    );

    emit(
      state.copyWith(
        editingIds: updatedEditingIds,
        ongoing: state.ongoing
            .map((b) => b.id == booking.id ? updatedBooking : b)
            .toList(),
      ),
    );
  }
}
