import 'package:bloc/bloc.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Owner/data/repo/owner_repo.dart';
import 'package:meta/meta.dart';

part 'owner_properties_state.dart';

class OwnerPropertiesCubit extends Cubit<OwnerPropertiesState> {
  OwnerPropertiesCubit() : super(OwnerInitial());
  final OwnerRepo _ownerRepo = OwnerRepo();

  Future<void> getOwnerProperties() async {
    emit(OwnerPropertiesLoading());
    final (properties, errorMessage) = await _ownerRepo.getOwnerProperties();

    if (errorMessage != null) {
      emit(OwnerPropertiesError(errorMessage));
    } else {
      emit(OwnerPropertiesLoaded(properties));
    }
  }
}
