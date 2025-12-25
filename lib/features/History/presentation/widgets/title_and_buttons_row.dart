import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/History/data/model/book_model.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleAndButtonsRow extends StatelessWidget {
  const TitleAndButtonsRow({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    if (book.status == "Active" || book.status == "Upcoming") {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                capitalize(book.property.category),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.edit, color: kPrimaryColor.withAlpha(125), size: 22),
            SizedBox(width: 12),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Cancel booking"),
                      content: const Text(
                        "Are you sure you want to cancel this booking?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<BookingHistoryCubit>()
                                    .cancelBooking(book);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Cancel Booking",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.cancel, color: Colors.red, size: 22),
            ),
          ],
        ),
      );
    } else if (book.status == "Completed") {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                capitalize(book.property.category),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    "Rate it now!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.star, color: Colors.yellow, size: 24),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (book.status == "Canceled") {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                capitalize(book.property.category),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),

            SizedBox(width: 8),
          ],
        ),
      );
    } else if (book.status == "PendingEdit" || book.status == "Pending") {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                capitalize(book.property.category),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),

            SizedBox(width: 8),
          ],
        ),
      );
    } else {
      return const Text("Wrong status");
    }
  }
}
