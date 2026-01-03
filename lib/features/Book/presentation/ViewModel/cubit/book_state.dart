import 'package:book_it/features/Book/data/repo/book_repo.dart';
import 'package:meta/meta.dart';

@immutable
sealed class BookState {}

final class BookInitial extends BookState {}

final class BookLoading extends BookState {}

final class BookSuccess extends BookState {}

final class BookFailure extends BookState {
  final BookError error;

  BookFailure(this.error);
}
