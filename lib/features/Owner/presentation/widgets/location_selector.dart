import 'package:flutter/material.dart';
import 'package:book_it/core/utils/helpers.dart';

class LocationSelector extends StatelessWidget {
  final String? selectedGovernorate;
  final String? selectedCity;
  final Function(String?) onGovernorateChanged;
  final Function(String?) onCityChanged;

  const LocationSelector({
    super.key,
    this.selectedGovernorate,
    this.selectedCity,
    required this.onGovernorateChanged,
    required this.onCityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cities = getCities(selectedGovernorate);

    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: theme.colorScheme.surfaceVariant,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Location:",
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          hint: Text("Select Governorate", style: theme.textTheme.bodyMedium),
          decoration: inputDecoration,
          items: getGovernorates()
              .where((g) => g != "All")
              .map(
                (gov) => DropdownMenuItem(
                  value: gov,
                  child: Text(gov, style: theme.textTheme.bodyMedium),
                ),
              )
              .toList(),
          onChanged: onGovernorateChanged,
          dropdownColor: theme.colorScheme.surface,
          elevation: 4,
          style: theme.textTheme.bodyMedium,
          initialValue:
              selectedGovernorate, // use initialValue instead of deprecated value
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          hint: Text("Select City", style: theme.textTheme.bodyMedium),
          decoration: inputDecoration,
          items: cities
              .map(
                (c) => DropdownMenuItem(
                  value: c,
                  child: Text(c, style: theme.textTheme.bodyMedium),
                ),
              )
              .toList(),
          onChanged: onCityChanged,
          dropdownColor: theme.colorScheme.surface,
          elevation: 4,
          style: theme.textTheme.bodyMedium,
          initialValue: cities.contains(selectedCity)
              ? selectedCity
              : null, // fixed
        ),
      ],
    );
  }
}
