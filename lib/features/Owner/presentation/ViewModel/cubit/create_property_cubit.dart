import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:book_it/features/Owner/data/repo/owner_properties_repo.dart';
import 'package:meta/meta.dart';

part 'create_property_state.dart';

class CreatePropertyCubit extends Cubit<CreatePropertyState> {
  CreatePropertyCubit(this._repo) : super(CreatePropertyInitial());

  final OwnerPropertiesRepo _repo;

  Future<void> createProperty({
    required String name,
    required String description,
    required String category,
    required String governorate,
    required String city,
    required int pricePerDay,
    required int area,
    required int rooms,
    required int bathrooms,
    required int kitchens,
    required List<File> images,
  }) async {
    emit(CreatePropertyLoading());

    final error = await _repo.createProperty(
      name: name,
      description: description,
      category: category,
      governorate: governorate,
      city: city,
      pricePerDay: pricePerDay,
      area: area,
      rooms: rooms,
      bathrooms: bathrooms,
      kitchens: kitchens,
      images: images,
    );

    if (error != null) {
      emit(CreatePropertyError(error));
    } else {
      emit(CreatePropertySuccess());
    }
  }
}
