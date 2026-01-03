part of 'create_property_cubit.dart';

@immutable
sealed class CreatePropertyState {}

class CreatePropertyInitial extends CreatePropertyState {}

class CreatePropertyLoading extends CreatePropertyState {}

class CreatePropertySuccess extends CreatePropertyState {}

class CreatePropertyErrorState extends CreatePropertyState {
  final OwnerPropertyError error;
  CreatePropertyErrorState(this.error);
}
