part of 'create_property_cubit.dart';

@immutable
sealed class CreatePropertyState {}

class CreatePropertyInitial extends CreatePropertyState {}

class CreatePropertyLoading extends CreatePropertyState {}

class CreatePropertySuccess extends CreatePropertyState {}

class CreatePropertyError extends CreatePropertyState {
  final String message;
  CreatePropertyError(this.message);
}
