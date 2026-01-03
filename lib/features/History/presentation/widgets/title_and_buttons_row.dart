import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/category_localization.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/History/data/model/book_model.dart';
import 'package:flutter/material.dart';

class TitleAndButtonsRow extends StatelessWidget {
  const TitleAndButtonsRow({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    if (book.status == "Active" || book.status == "Upcoming") {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 4, left: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                localizedCategory(context, book.property.category),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                if (book.status == "Upcoming") {
                  showEditUpcomingBookingDialog(context, book);
                }
                if (book.status == "Active") {
                  showEditActiveBookingDialog(context, book);
                }
              },
              child: Icon(
                Icons.edit,
                color: kPrimaryColor.withAlpha(200),
                size: 22,
              ),
            ),
            SizedBox(width: 12),
            GestureDetector(
              onTap: () {
                showCancelBookingDialog(context, book);
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
                localizedCategory(context, book.property.category),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
            // GestureDetector(
            //   onTap: () {},
            //   child: book.rating == null
            //       ? Row(
            //           children: [
            //             Text(
            //               "Rate it now!",
            //               style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w700,
            //                 color: Colors.yellow,
            //               ),
            //             ),
            //             // SizedBox(width: 8),
            //             Icon(Icons.star, color: Colors.yellow, size: 24),
            //           ],
            //         )
            //       : Row(
            //           children: List.generate(book.rating!.stars, (index) {
            //             return Icon(Icons.star, color: Colors.yellow, size: 24);
            //           }),
            //         ),
            // ),
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
                localizedCategory(context, book.property.category),
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
                localizedCategory(context, book.property.category),
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
