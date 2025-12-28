import 'package:flutter/material.dart';
import 'package:book_it/core/style/colors.dart';

class CategorySelectorChips extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final Function(String?) onCategorySelected;

  const CategorySelectorChips({
    super.key,
    required this.categories,
    this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Property Category:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: categories.map((category) {
            return ChoiceChip(
              label: Text(category),
              selected: selectedCategory == category,
              onSelected: (selected) =>
                  onCategorySelected(selected ? category : null),
              selectedColor: kPrimaryColor.withAlpha(150),
              backgroundColor: Colors.grey[200],
              labelStyle: TextStyle(
                color: selectedCategory == category
                    ? Colors.white
                    : Colors.black87,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
