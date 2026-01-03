part of 'property_rating_cubit.dart';

sealed class PropertyRatingState {}

final class PropertyRatingInitial extends PropertyRatingState {}

final class PropertyRatingLoading extends PropertyRatingState {}

final class PropertyRatingSuccess extends PropertyRatingState {}

final class PropertyRatingFailure extends PropertyRatingState {
  final PropertyError error;
  PropertyRatingFailure(this.error);
}
