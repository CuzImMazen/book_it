import 'package:book_it/features/Owner/data/models/pending_booking.dart';
import 'package:meta/meta.dart';

@immutable
sealed class OwnerRequestsState {}

class OwnerRequestsInitial extends OwnerRequestsState {}

class OwnerRequestsLoading extends OwnerRequestsState {}

class OwnerRequestsLoaded extends OwnerRequestsState {
  final List<PendingBookingModel> bookings;
  OwnerRequestsLoaded(this.bookings);
}

class FetchRequestsFailure extends OwnerRequestsState {
  final String message;
  FetchRequestsFailure(this.message);
}

class ActionFailure extends OwnerRequestsState {
  final String message;
  ActionFailure(this.message);
}

class AcceptSuccess extends OwnerRequestsState {}

class RejectSuccess extends OwnerRequestsState {}
