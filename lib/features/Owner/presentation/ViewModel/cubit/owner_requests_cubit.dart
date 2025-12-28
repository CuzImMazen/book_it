import 'package:bloc/bloc.dart';
import 'package:book_it/features/Owner/data/repo/owner_requests_repo.dart';
import 'owner_requests_state.dart';

class OwnerRequestsCubit extends Cubit<OwnerRequestsState> {
  OwnerRequestsCubit(this.repo) : super(OwnerRequestsInitial());

  final OwnerRequestsRepo repo;

  int? loadingBookingId;
  int? loadingModificationId;

  // Future<void> getAllRequests() async {
  //   emit(OwnerRequestsLoading());
  //   try {
  //     final (bookings, bookingsError) = await repo.getPendingRequests();
  //     if (isClosed) return;
  //     final (modifications, modificationsError) = await repo
  //         .getPendingModificationRequests();
  //     if (isClosed) return;
  //     if (bookingsError != null || modificationsError != null) {
  //       emit(
  //         OwnerRequestsFailure(
  //           bookingsError ?? modificationsError ?? "Unknown error",
  //         ),
  //       );
  //       return;
  //     }

  //     emit(
  //       OwnerRequestsLoaded(
  //         bookings: bookings,
  //         modifications: modifications,
  //         loadingBookingId: null,
  //         loadingModificationId: null,
  //       ),
  //     );
  //   } catch (e) {
  //     if (!isClosed) {
  //       emit(OwnerRequestsFailure(e.toString()));
  //     }
  //   }
  // }
  Future<void> getAllRequests() async {
    emit(OwnerRequestsLoading());

    final (bookings, bookingsError) = await repo.getPendingRequests();
    if (isClosed) return;

    final (modifications, modificationsError) = await repo
        .getPendingModificationRequests();
    if (isClosed) return;

    if (bookingsError != null || modificationsError != null) {
      emit(
        OwnerRequestsFailure(
          bookingsError ?? modificationsError ?? "Unknown error",
        ),
      );
      return;
    }

    emit(
      OwnerRequestsLoaded(
        bookings: bookings,
        modifications: modifications,
        loadingBookingId: null,
        loadingModificationId: null,
      ),
    );
  }

  Future<void> acceptBooking(int id) async {
    final current = state;
    if (current is! OwnerRequestsLoaded) return;

    emit(current.copyWith(loadingBookingId: id));

    final (success, message) = await repo.acceptBookingRequest(id);
    if (isClosed) return;

    emit(
      OwnerRequestsLoaded(
        bookings: success
            ? current.bookings.where((b) => b.id != id).toList()
            : current.bookings,
        modifications: current.modifications,
        loadingBookingId: null,
        loadingModificationId: current.loadingModificationId,
        snackMessage: "$message|${DateTime.now().millisecondsSinceEpoch}",
        snackSuccess: success,
      ),
    );
  }

  Future<void> rejectBooking(int id) async {
    final current = state;
    if (current is! OwnerRequestsLoaded) return;

    emit(current.copyWith(loadingBookingId: id));

    final (success, message) = await repo.rejectBookingRequest(id);
    if (isClosed) return;

    emit(
      OwnerRequestsLoaded(
        bookings: success
            ? current.bookings.where((b) => b.id != id).toList()
            : current.bookings,
        modifications: current.modifications,
        loadingBookingId: null,
        loadingModificationId: current.loadingModificationId,
        snackMessage: "$message|${DateTime.now().millisecondsSinceEpoch}",
        snackSuccess: success,
      ),
    );
  }

  Future<void> acceptModification(int id) async {
    final current = state;
    if (current is! OwnerRequestsLoaded) return;

    emit(current.copyWith(loadingModificationId: id));

    final (success, message) = await repo.acceptModificationRequest(id);
    if (isClosed) return;
    emit(
      OwnerRequestsLoaded(
        bookings: current.bookings,
        modifications: success
            ? current.modifications.where((m) => m.id != id).toList()
            : current.modifications,
        loadingBookingId: current.loadingBookingId,
        loadingModificationId: null,
        snackMessage: "$message|${DateTime.now().millisecondsSinceEpoch}",
        snackSuccess: success,
      ),
    );
  }

  Future<void> rejectModification(int id) async {
    final current = state;
    if (current is! OwnerRequestsLoaded) return;

    emit(current.copyWith(loadingModificationId: id));

    final (success, message) = await repo.rejectModificationRequest(id);
    if (isClosed) return;

    emit(
      OwnerRequestsLoaded(
        bookings: current.bookings,
        modifications: success
            ? current.modifications.where((m) => m.id != id).toList()
            : current.modifications,
        loadingBookingId: current.loadingBookingId,
        loadingModificationId: null,
        snackMessage: "$message|${DateTime.now().millisecondsSinceEpoch}",
        snackSuccess: success,
      ),
    );
  }

  void clearSnackBar() {
    if (isClosed) return;
    final current = state;
    if (current is OwnerRequestsLoaded) {
      emit(current.copyWith(snackMessage: null, snackSuccess: null));
    }
  }
}
