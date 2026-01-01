import 'package:book_it/features/History/data/model/book_model.dart';
import 'package:book_it/features/History/presentation/widgets/book_date_and_status_row.dart';
import 'package:book_it/features/History/presentation/widgets/title_and_buttons_row.dart';

import 'package:flutter/material.dart';

class BookingsContainer extends StatelessWidget {
  const BookingsContainer({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(20),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withAlpha(25)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        height: 100,
                        width: 100,
                        book.property.mainImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleAndButtonsRow(book: book),
                        SizedBox(
                          width: 185,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            "${book.property.governorate}, ${book.property.city}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "\$${book.property.price}/Night",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),
                        BookDateAndStatusRow(book: book),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
