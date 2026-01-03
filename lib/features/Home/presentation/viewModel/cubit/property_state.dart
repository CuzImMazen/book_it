part of 'property_cubit.dart';

sealed class PropertyState {}

final class PropertyInitial extends PropertyState {}

final class PropertyLoading extends PropertyState {}

final class PropertyLoaded extends PropertyState {
  final List<PropertyModel> properties;
  PropertyLoaded(this.properties);
}

final class PropertyErrorState extends PropertyState {
  final PropertyError error;
  PropertyErrorState(this.error);
}
