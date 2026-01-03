import 'package:bloc/bloc.dart';
import 'package:book_it/features/Book/data/repo/book_repo.dart';
import 'package:book_it/features/Book/presentation/ViewModel/cubit/book_state.dart';

class BookCubit extends Cubit<BookState> {
  final BookRepo _bookRepo;

  BookCubit(this._bookRepo) : super(BookInitial());

  Future<void> createBook({
    required int id,
    required String startDate,
    required String endDate,
    required String cardNumber,
    required String billingAddress,
  }) async {
    emit(BookLoading());

    final error = await _bookRepo.createBook(
      id: id,
      startDate: startDate,
      endDate: endDate,
      cardNumber: cardNumber,
      billingAddress: billingAddress,
    );

    if (error == null) {
      emit(BookSuccess());
    } else {
      emit(BookFailure(error));
    }
  }
}
