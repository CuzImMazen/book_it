import 'package:bloc/bloc.dart';
import 'package:book_it/features/Home/data/repo/property_repo.dart';

part 'property_rating_state.dart';

class PropertyRatingCubit extends Cubit<PropertyRatingState> {
  final PropertyRepo _propertyRepo;

  PropertyRatingCubit(this._propertyRepo) : super(PropertyRatingInitial());

  Future<void> rateProperty(int propertyId, double stars) async {
    if (isClosed) return;
    emit(PropertyRatingLoading());

    final (success, error) = await _propertyRepo.rateProperty(
      propertyId,
      stars,
    );
    if (isClosed) return;
    if (success) {
      emit(PropertyRatingSuccess());
    } else {
      emit(PropertyRatingFailure(error ?? PropertyError.unknown));
    }
  }
}
