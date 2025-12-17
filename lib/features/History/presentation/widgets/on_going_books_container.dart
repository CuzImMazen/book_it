import 'package:book_it/features/History/presentation/widgets/book_date_and_status_row.dart';
import 'package:book_it/features/History/presentation/widgets/title_and_buttons_row.dart';
import 'package:flutter/material.dart';

class OnGoingBooksContainer extends StatelessWidget {
  const OnGoingBooksContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(20),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withAlpha(25)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      height: 100,
                      width: 100,
                      "assets/images/house.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleAndButtonsRow(),

                      SizedBox(
                        width: 185,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          "Damascus, AlShalaannnn ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "120\$/Night",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      BookDateAndStatusRow(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
