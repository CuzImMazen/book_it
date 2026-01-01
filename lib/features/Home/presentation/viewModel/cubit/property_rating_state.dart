part of 'property_rating_cubit.dart';

sealed class PropertyRatingState extends Equatable {
  const PropertyRatingState();

  @override
  List<Object> get props => [];
}

final class PropertyRatingInitial extends PropertyRatingState {}

class PropertyRatingLoading extends PropertyRatingState {}

class PropertyRatingSuccess extends PropertyRatingState {}

class PropertyRatingFailure extends PropertyRatingState {
  final String message;
  const PropertyRatingFailure(this.message);
}
