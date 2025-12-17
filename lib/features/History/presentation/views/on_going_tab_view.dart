import 'package:book_it/features/History/presentation/widgets/on_going_books_container.dart';
import 'package:flutter/material.dart';

class OnGoingTabView extends StatelessWidget {
  const OnGoingTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return OnGoingBooksContainer();
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: 3,
      ),
    );
  }
}
