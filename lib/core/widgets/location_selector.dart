import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/core/utils/location_localization.dart';
import 'package:flutter/material.dart';
import 'package:book_it/core/extensions/localization_extension.dart';

class LocationSelector extends StatelessWidget {
  final String? selectedGovernorate;
  final String? selectedCity;
  final Function(String?) onGovernorateChanged;
  final Function(String?) onCityChanged;
  final bool showAllOption;

  const LocationSelector({
    super.key,
    this.selectedGovernorate,
    this.selectedCity,
    required this.onGovernorateChanged,
    required this.onCityChanged,
    required this.showAllOption,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final governorates = [
      if (showAllOption) "All",
      ...getGovernorates().where((g) => g != "All"),
    ].toList();
    final cities = getCities(selectedGovernorate);

    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: theme.colorScheme.surfaceContainerHighest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          context.home.filters_select_city,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),

        // Governorate Dropdown
        DropdownButtonFormField<String>(
          hint: Text(
            context.home.filters_select_governorate,
            style: theme.textTheme.bodyMedium,
          ),
          decoration: inputDecoration,
          items: governorates
              .map(
                (gov) => DropdownMenuItem(
                  value: gov,
                  child: Text(
                    localizedGovernorate(context, gov),
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              )
              .toList(),
          onChanged: onGovernorateChanged,
          dropdownColor: theme.colorScheme.surface,
          elevation: 4,
          style: theme.textTheme.bodyMedium,
          initialValue: selectedGovernorate,
        ),
        const SizedBox(height: 10),

        // City Dropdown
        DropdownButtonFormField<String>(
          hint: Text(
            context.home.filters_select_city,
            style: theme.textTheme.bodyMedium,
          ),
          decoration: inputDecoration,
          items: cities
              .map(
                (city) => DropdownMenuItem(
                  value: city,
                  child: Text(
                    localizedCity(context, selectedGovernorate, city),
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              )
              .toList(),
          onChanged: onCityChanged,
          dropdownColor: theme.colorScheme.surface,
          elevation: 4,
          style: theme.textTheme.bodyMedium,
          initialValue: cities.contains(selectedCity) ? selectedCity : null,
        ),
      ],
    );
  }
}
