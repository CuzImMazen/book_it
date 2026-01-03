part of 'owner_properties_cubit.dart';

@immutable
sealed class OwnerPropertiesState {}

class OwnerInitial extends OwnerPropertiesState {}

class OwnerPropertiesLoading extends OwnerPropertiesState {}

class OwnerPropertiesLoaded extends OwnerPropertiesState {
  final List<PropertyModel> properties;
  OwnerPropertiesLoaded(this.properties);
}

class OwnerPropertiesErrorState extends OwnerPropertiesState {
  final OwnerPropertyError error;
  OwnerPropertiesErrorState(this.error);
}
