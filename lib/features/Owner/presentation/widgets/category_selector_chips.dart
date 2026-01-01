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
    final theme = Theme.of(context);
    final unselectedColor =
        theme.colorScheme.surface; // replaces deprecated surfaceVariant
    final selectedTextColor = Colors.white; // always white on primary
    final unselectedTextColor = theme.colorScheme.onSurface.withOpacity(0.8);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Property Category:",
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: categories.map((category) {
            final isSelected = selectedCategory == category;
            return ChoiceChip(
              label: Text(
                category,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isSelected ? selectedTextColor : unselectedTextColor,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) =>
                  onCategorySelected(selected ? category : null),
              selectedColor: kPrimaryColor,
              backgroundColor: unselectedColor,
              elevation: isSelected ? 4 : 0,
              shadowColor: Colors.black45,
            );
          }).toList(),
        ),
      ],
    );
  }
}
