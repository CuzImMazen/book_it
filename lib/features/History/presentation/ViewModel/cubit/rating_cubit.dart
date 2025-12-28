import 'package:bloc/bloc.dart';
import 'package:book_it/features/History/data/repo/booking_history_repo.dart';
import 'package:meta/meta.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  final BookingHistoryRepo repository;
  RatingCubit(this.repository) : super(RatingInitial());

  Future<void> addRating(int id, int stars, String? comment) async {
    emit(RatingLoading());
    final (success, message) = await repository.addRating(id, stars, comment);

    if (!success) {
      emit(RatingFailure(message));
      return;
    }
    emit(RatingSuccess(message));
  }

  Future<void> editRating(int id, int stars, String? comment) async {
    emit(RatingLoading());
    final (success, message) = await repository.editRating(id, stars, comment);

    if (!success) {
      emit(RatingFailure(message));
      return;
    }
    emit(RatingSuccess(message));
  }
}
