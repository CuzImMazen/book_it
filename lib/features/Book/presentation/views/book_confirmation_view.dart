import 'package:book_it/features/Book/data/model/confirm_book_data.dart';
import 'package:book_it/features/Book/data/repo/book_repo.dart';
import 'package:book_it/features/Book/presentation/ViewModel/cubit/book_cubit.dart';
import 'package:book_it/features/Book/presentation/widgets/book_confirmation_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookConfirmationView extends StatelessWidget {
  const BookConfirmationView({super.key, required this.confirmBookData});
  final ConfirmBookData confirmBookData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BookCubit(BookRepo()),
        child: BookConfirmationViewBody(confirmBookData: confirmBookData),
      ),
    );
  }
}
