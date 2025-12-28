import 'package:bloc/bloc.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Owner/data/repo/owner_properties_repo.dart';
import 'package:meta/meta.dart';

part 'owner_properties_state.dart';

class OwnerPropertiesCubit extends Cubit<OwnerPropertiesState> {
  OwnerPropertiesCubit() : super(OwnerInitial());
  final OwnerPropertiesRepo _ownerRepo = OwnerPropertiesRepo();

  Future<void> getOwnerProperties() async {
    if (isClosed) return;
    emit(OwnerPropertiesLoading());
    final (properties, errorMessage) = await _ownerRepo.getOwnerProperties();
    if (isClosed) return;

    if (errorMessage != null) {
      emit(OwnerPropertiesError(errorMessage));
    } else {
      emit(OwnerPropertiesLoaded(properties));
    }
  }
}
