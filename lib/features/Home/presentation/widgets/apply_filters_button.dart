import 'package:book_it/core/style/colors.dart';
import 'package:flutter/material.dart';

class ApplyFiltersButton extends StatelessWidget {
  const ApplyFiltersButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kPrimaryColor.withAlpha(200),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            " Apply Filter",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
