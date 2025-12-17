import 'package:flutter/material.dart';

class BookDateAndStatusRow extends StatelessWidget {
  const BookDateAndStatusRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            "Oct 25 - Oct 28",
            textAlign: TextAlign.end,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green.withAlpha(100),
            ),

            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 6.0,
                ),
                child: Text(
                  "Active",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
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
