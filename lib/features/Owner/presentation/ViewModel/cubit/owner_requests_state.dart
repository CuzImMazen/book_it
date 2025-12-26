import 'package:book_it/features/Owner/data/models/pending_booking.dart';

abstract class OwnerRequestsState {}

class OwnerRequestsInitial extends OwnerRequestsState {}

class OwnerRequestsLoading extends OwnerRequestsState {}

class OwnerRequestsFailure extends OwnerRequestsState {
  final String message;
  OwnerRequestsFailure(this.message);
}

class OwnerRequestsLoaded extends OwnerRequestsState {
  final List<PendingBookingModel> bookings;
  final List<PendingBookingModel> modifications;
  final Set<int> loadingIds;

  OwnerRequestsLoaded({
    required this.bookings,
    required this.modifications,
    this.loadingIds = const {},
  });

  OwnerRequestsLoaded copyWith({
    List<PendingBookingModel>? bookings,
    List<PendingBookingModel>? modifications,
    Set<int>? loadingIds,
  }) {
    return OwnerRequestsLoaded(
      bookings: bookings ?? this.bookings,
      modifications: modifications ?? this.modifications,
      loadingIds: loadingIds ?? this.loadingIds,
    );
  }
}

class OwnerRequestAction extends OwnerRequestsState {
  final bool success;
  final String message;

  OwnerRequestAction({required this.success, required this.message});
}
