import 'package:bloc/bloc.dart';
import 'package:book_it/features/Home/data/repo/property_repo.dart';
import 'package:equatable/equatable.dart';

part 'property_rating_state.dart';

class PropertyRatingCubit extends Cubit<PropertyRatingState> {
  final PropertyRepo _propertyRepo;

  PropertyRatingCubit(this._propertyRepo) : super(PropertyRatingInitial());

  Future<void> rateProperty(int propertyId, double stars) async {
    emit(PropertyRatingLoading());

    final (success, errorMessage) = await _propertyRepo.rateProperty(
      propertyId,
      stars,
    );

    if (success) {
      emit(PropertyRatingSuccess());
    } else {
      emit(PropertyRatingFailure(errorMessage ?? 'Rating failed'));
    }
  }
}
