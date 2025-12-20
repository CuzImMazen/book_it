import 'package:bloc/bloc.dart';
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
    ]);

    final current = results[0];
    final future = results[1];

    final merged = [...current.$1, ...future.$1];

    final errorMessages = [
      current.$2,
      future.$2,
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

  void reset() {
    emit(BookingHistoryState.initial());
  }
}
