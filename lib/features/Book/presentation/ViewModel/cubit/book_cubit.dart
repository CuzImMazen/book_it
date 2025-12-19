import 'package:bloc/bloc.dart';
import 'package:book_it/features/Book/data/repo/book_repo.dart';
import 'package:meta/meta.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  final BookRepo _bookRepo;
  BookCubit(this._bookRepo) : super(BookInitial());

  Future<void> createBook(
    int id,
    String startDate,
    String endDate,
    String cardNumber,
    String billingAddress,
  ) async {
    emit(BookLoading());
    final errorMessage = await _bookRepo.createBook(
      id,
      startDate,
      endDate,
      cardNumber,
      billingAddress,
    );
    if (errorMessage == null) {
      emit(BookSuccess());
    } else {
      emit(BookFailure(errorMessage));
    }
  }
}
