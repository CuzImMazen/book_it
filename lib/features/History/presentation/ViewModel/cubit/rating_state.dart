part of 'rating_cubit.dart';

@immutable
sealed class RatingState {}

final class RatingInitial extends RatingState {}

final class RatingLoading extends RatingState {}

final class RatingSuccess extends RatingState {
  final String message;
  RatingSuccess(this.message);
}

final class RatingFailure extends RatingState {
  final String error;

  RatingFailure(this.error);
}
