part of 'book_cubit.dart';

@immutable
sealed class BookState {}

final class BookInitial extends BookState {}

final class BookLoading extends BookState {}

final class BookSuccess extends BookState {}

final class BookFailure extends BookState {
  final String message;

  BookFailure(this.message);
}
