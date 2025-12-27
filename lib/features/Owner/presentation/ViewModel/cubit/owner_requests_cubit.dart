import 'package:bloc/bloc.dart';
import 'package:book_it/features/Owner/data/repo/owner_requests_repo.dart';
import 'owner_requests_state.dart';

class OwnerRequestsCubit extends Cubit<OwnerRequestsState> {
  OwnerRequestsCubit(this.repo) : super(OwnerRequestsInitial());

  final OwnerRequestsRepo repo;

  Future<void> getAllRequests() async {
    emit(OwnerRequestsLoading());
    try {
      final (bookings, bookingsError) = await repo.getPendingRequests();
      final (modifications, modificationsError) = await repo
          .getPendingModificationRequests();

      if (bookingsError != null || modificationsError != null) {
        emit(
          OwnerRequestsFailure(
            bookingsError ?? modificationsError ?? "Unknown error",
          ),
        );
        return;
      }

      emit(
        OwnerRequestsLoaded(bookings: bookings, modifications: modifications),
      );
    } catch (e) {
      emit(OwnerRequestsFailure(e.toString()));
    }
  }

  Future<void> acceptBooking(int id) async {
    final current = state;
    if (current is! OwnerRequestsLoaded) return;

    emit(current.copyWith(loadingBookingId: id));

    final (success, message) = await repo.acceptBookingRequest(id);

    emit(
      current.copyWith(
        loadingBookingId: null,
        bookings: success
            ? current.bookings.where((b) => b.id != id).toList()
            : current.bookings,
        snackMessage: message,
        snackSuccess: success,
      ),
    );
  }

  Future<void> rejectBooking(int id) async {
    final current = state;
    if (current is! OwnerRequestsLoaded) return;

    emit(current.copyWith(loadingBookingId: id));

    final (success, message) = await repo.rejectBookingRequest(id);

    emit(
      current.copyWith(
        loadingBookingId: null,
        bookings: success
            ? current.bookings.where((b) => b.id != id).toList()
            : current.bookings,
        snackMessage: message,
        snackSuccess: success,
      ),
    );
  }

  Future<void> acceptModification(int id) async {
    final current = state;
    if (current is! OwnerRequestsLoaded) return;

    emit(current.copyWith(loadingModificationId: id));

    final (success, message) = await repo.acceptModificationRequest(id);

    emit(
      current.copyWith(
        loadingModificationId: null,
        modifications: success
            ? current.modifications.where((m) => m.id != id).toList()
            : current.modifications,
        snackMessage: message,
        snackSuccess: success,
      ),
    );
  }

  Future<void> rejectModification(int id) async {
    final current = state;
    if (current is! OwnerRequestsLoaded) return;

    emit(current.copyWith(loadingModificationId: id));

    final (success, message) = await repo.rejectModificationRequest(id);

    emit(
      current.copyWith(
        loadingModificationId: null,
        modifications: success
            ? current.modifications.where((m) => m.id != id).toList()
            : current.modifications,
        snackMessage: message,
        snackSuccess: success,
      ),
    );
  }

  void clearSnackBar() {
    final current = state;
    if (current is OwnerRequestsLoaded) {
      emit(current.copyWith(snackMessage: null, snackSuccess: null));
    }
  }
}
