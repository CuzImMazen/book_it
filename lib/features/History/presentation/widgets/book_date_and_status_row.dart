import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/History/data/model/book_model.dart';
import 'package:flutter/material.dart';

class BookDateAndStatusRow extends StatelessWidget {
  const BookDateAndStatusRow({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    late final MaterialColor statusColor;
    if (book.status == "Active" || book.status == "Upcoming") {
      statusColor = Colors.green;
    } else if (book.status == "Completed" ||
        book.status == "PendingEdit" ||
        book.status == "Pending") {
      statusColor = Colors.grey;
    } else if (book.status == "Canceled") {
      statusColor = Colors.red;
    } else {
      statusColor = Colors.grey;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            formatBookingDates(book.startDate, book.endDate),
            textAlign: TextAlign.end,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: statusColor.withAlpha(100),
            ),

            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 6.0,
                ),
                child: Text(
                  book.status == "PendingEdit" ? "Pending Edit" : book.status,

                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
