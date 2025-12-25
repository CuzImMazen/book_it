import 'package:bloc/bloc.dart';
import 'package:book_it/features/Owner/data/repo/owner_requests_repo.dart';
import 'owner_requests_state.dart';

class OwnerRequestsCubit extends Cubit<OwnerRequestsState> {
  OwnerRequestsCubit() : super(OwnerRequestsInitial());

  final OwnerRequestsRepo _repo = OwnerRequestsRepo();

  Future<void> getPendingRequests() async {
    emit(OwnerRequestsLoading());

    final (bookings, errorMessage) = await _repo.getPendingRequests();

    if (errorMessage != null) {
      emit(FetchRequestsFailure(errorMessage));
    } else {
      emit(OwnerRequestsLoaded(bookings));
    }
  }

  Future<void> acceptBookingRequest(int id) async {
    final (success, errorMessage) = await _repo.acceptBookingRequest(id);

    if (success) {
      emit(AcceptSuccess());
      await getPendingRequests();
    } else {
      _emitActionFailure(errorMessage ?? "Failed to accept booking");
    }
  }

  Future<void> rejectBookingRequest(int id) async {
    final (success, errorMessage) = await _repo.rejectBookingRequest(id);

    if (success) {
      emit(RejectSuccess());
      await getPendingRequests();
    } else {
      _emitActionFailure(errorMessage ?? "Failed to reject booking");
    }
  }

  void _emitActionFailure(String message) {
    final currentState = state;
    emit(ActionFailure(message));
    emit(currentState);
  }
}
