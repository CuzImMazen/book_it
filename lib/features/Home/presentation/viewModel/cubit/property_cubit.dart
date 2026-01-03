import 'package:bloc/bloc.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Home/data/repo/property_repo.dart';

part 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  final PropertyRepo _propertyRepo;

  PropertyCubit(this._propertyRepo) : super(PropertyInitial());

  Future<void> getProperties(Map<String, String> queryParameters) async {
    emit(PropertyLoading());

    final (properties, error) = await _propertyRepo.getProperties(
      queryParameters,
    );

    if (error != null) {
      emit(PropertyErrorState(error));
    } else {
      emit(PropertyLoaded(properties));
    }
  }
}
