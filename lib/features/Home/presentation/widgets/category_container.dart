import 'package:book_it/core/style/colors.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryContainer({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withAlpha(50)),
          color: isSelected
              ? kPrimaryColor.withAlpha(200)
              : Colors.grey.withAlpha(125),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
