import 'package:book_it/features/Owner/data/repo/owner_requests_repo.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OwnerRequestsCubit extends Cubit<OwnerRequestsState> {
  final OwnerRequestsRepo _repo = OwnerRequestsRepo();

  OwnerRequestsCubit() : super(OwnerRequestsInitial());

  /// LOAD ON START
  Future<void> loadRequests() async {
    emit(OwnerRequestsLoading());

    final bookingsResult = await _repo.getPendingRequests();
    final modificationsResult = await _repo.getPendingModificationRequests();

    final error = bookingsResult.$2 ?? modificationsResult.$2;
    if (error != null) {
      emit(OwnerRequestsFailure(error));
      return;
    }

    emit(
      OwnerRequestsLoaded(
        bookings: bookingsResult.$1,
        modifications: modificationsResult.$1,
      ),
    );
  }

  /// ---------- BOOKING ----------
  Future<void> acceptBooking(int id) async {
    _setItemLoading(id, true);

    final (success, error) = await _repo.acceptBookingRequest(id);

    _handleResult(
      success: success,
      error: error,
      onSuccess: (s) =>
          s.copyWith(bookings: s.bookings.where((b) => b.id != id).toList()),
      successMessage: "Booking accepted",
      failureMessage: "Failed to accept booking",
      id: id,
    );
  }

  Future<void> rejectBooking(int id) async {
    _setItemLoading(id, true);

    final (success, error) = await _repo.rejectBookingRequest(id);

    _handleResult(
      success: success,
      error: error,
      onSuccess: (s) =>
          s.copyWith(bookings: s.bookings.where((b) => b.id != id).toList()),
      successMessage: "Booking rejected",
      failureMessage: "Failed to reject booking",
      id: id,
    );
  }

  /// ---------- MODIFICATION ----------
  Future<void> acceptModification(int id) async {
    _setItemLoading(id, true);

    final (success, error) = await _repo.acceptModificationRequest(id);

    _handleResult(
      success: success,
      error: error,
      onSuccess: (s) => s.copyWith(
        modifications: s.modifications.where((m) => m.id != id).toList(),
      ),
      successMessage: "Modification accepted",
      failureMessage: "Failed to accept modification",
      id: id,
    );
  }

  Future<void> rejectModification(int id) async {
    _setItemLoading(id, true);

    final (success, error) = await _repo.rejectModificationRequest(id);

    _handleResult(
      success: success,
      error: error,
      onSuccess: (s) => s.copyWith(
        modifications: s.modifications.where((m) => m.id != id).toList(),
      ),
      successMessage: "Modification rejected",
      failureMessage: "Failed to reject modification",
      id: id,
    );
  }

  // ---------------- HELPERS ----------------

  void _setItemLoading(int id, bool loading) {
    final s = state;
    if (s is! OwnerRequestsLoaded) return;

    final newSet = Set<int>.from(s.loadingIds);
    loading ? newSet.add(id) : newSet.remove(id);

    emit(s.copyWith(loadingIds: newSet));
  }

  void _handleResult({
    required bool success,
    required String? error,
    required OwnerRequestsLoaded Function(OwnerRequestsLoaded) onSuccess,
    required String successMessage,
    required String failureMessage,
    required int id,
  }) {
    final s = state;
    if (s is! OwnerRequestsLoaded) return;

    _setItemLoading(id, false);

    if (success) {
      emit(onSuccess(s));
      emit(OwnerRequestAction(success: true, message: successMessage));
    } else {
      emit(
        OwnerRequestAction(success: false, message: error ?? failureMessage),
      );
    }
  }
}
