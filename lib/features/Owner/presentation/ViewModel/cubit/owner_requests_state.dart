import 'package:book_it/features/Owner/data/models/pending_booking.dart';

abstract class OwnerRequestsState {}

class OwnerRequestsInitial extends OwnerRequestsState {}

class OwnerRequestsLoading extends OwnerRequestsState {}

class OwnerRequestsFailure extends OwnerRequestsState {
  final String error;
  OwnerRequestsFailure(this.error);
}

class OwnerRequestsLoaded extends OwnerRequestsState {
  final List<PendingBookingModel> bookings;
  final List<PendingBookingModel> modifications;

  final int? loadingBookingId;
  final int? loadingModificationId;

  final String? snackMessage;
  final bool? snackSuccess;

  OwnerRequestsLoaded({
    required this.bookings,
    required this.modifications,
    this.loadingBookingId,
    this.loadingModificationId,
    this.snackMessage,
    this.snackSuccess,
  });

  OwnerRequestsLoaded copyWith({
    List<PendingBookingModel>? bookings,
    List<PendingBookingModel>? modifications,
    int? loadingBookingId,
    int? loadingModificationId,
    String? snackMessage,
    bool? snackSuccess,
  }) {
    return OwnerRequestsLoaded(
      bookings: bookings ?? this.bookings,
      modifications: modifications ?? this.modifications,
      loadingBookingId: loadingBookingId ?? this.loadingBookingId,
      loadingModificationId:
          loadingModificationId ?? this.loadingModificationId,
      snackMessage: snackMessage,
      snackSuccess: snackSuccess,
    );
  }
}
