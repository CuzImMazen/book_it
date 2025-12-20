import 'package:bloc/bloc.dart';
import 'package:book_it/features/History/data/repo/booking_history_repo.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_state.dart';

class BookingHistoryCubit extends Cubit<BookingHistoryState> {
  final BookingHistoryRepo repository;
  BookingHistoryCubit(this.repository) : super(BookingHistoryState.initial()) {
    fetchOngoingBookings();
    fetchPastBookings();
    fetchCanceledBookings();
  }

  Future<void> fetchOngoingBookings() async {
    emit(state.copyWith(isLoading: true, error: null));

    final current = await repository.getCurrentBookings();
    final future = await repository.getFutureBookings();

    final merged = [...current.$1, ...future.$1];

    final errorMessages = [
      current.$2,
      future.$2,
    ].where((e) => e != null && e.isNotEmpty).join("\n");

    emit(
      state.copyWith(
        ongoing: merged,
        isLoading: false,
        error: errorMessages.isEmpty ? null : errorMessages,
      ),
    );
  }

  Future<void> fetchPastBookings() async {
    emit(state.copyWith(isLoading: true, error: null));

    final pastResult = await repository.getOldBookings();

    emit(
      state.copyWith(
        completed: pastResult.$1, // typed empty list
        isLoading: false,
        error: pastResult.$2,
      ),
    );
  }

  Future<void> fetchCanceledBookings() async {
    emit(state.copyWith(isLoading: true, error: null));

    final canceledResult = await repository.getCanceledBookings();

    emit(
      state.copyWith(
        canceled: canceledResult.$1,
        isLoading: false,
        error: canceledResult.$2,
      ),
    );
  }
}
