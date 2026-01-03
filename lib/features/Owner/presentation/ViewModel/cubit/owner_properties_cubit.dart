import 'package:bloc/bloc.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Owner/data/repo/owner_properties_repo.dart';
import 'package:meta/meta.dart';

part 'owner_properties_state.dart';

class OwnerPropertiesCubit extends Cubit<OwnerPropertiesState> {
  final OwnerPropertiesRepo _ownerRepo;

  OwnerPropertiesCubit(this._ownerRepo) : super(OwnerInitial());

  Future<void> getOwnerProperties() async {
    if (isClosed) return;
    emit(OwnerPropertiesLoading());

    final (properties, error) = await _ownerRepo.getOwnerProperties();
    if (isClosed) return;

    if (error != null) {
      emit(OwnerPropertiesErrorState(error));
    } else {
      emit(OwnerPropertiesLoaded(properties));
    }
  }

  Future<void> deleteProperty(int propertyId) async {
    if (isClosed) return;
    final currentState = state;
    if (currentState is! OwnerPropertiesLoaded) return;

    final updatedList = currentState.properties
        .where((p) => p.id != propertyId)
        .toList();
    emit(OwnerPropertiesLoaded(updatedList));

    final error = await _ownerRepo.deleteProperty(propertyId);
    if (isClosed) return;

    if (error != null) {
      emit(OwnerPropertiesErrorState(error));
      emit(currentState);
    }
  }
}
