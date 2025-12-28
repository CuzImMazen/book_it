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
    final cities = getCities(selectedGovernorate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Location:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          hint: const Text("Select Governorate"),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          items: getGovernorates()
              .where((g) => g != "All")
              .map((gov) => DropdownMenuItem(value: gov, child: Text(gov)))
              .toList(),
          onChanged: onGovernorateChanged,
          dropdownColor: Colors.white,
          elevation: 4,
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          hint: const Text("Select City"),
          initialValue: cities.contains(selectedCity) ? selectedCity : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          items: cities
              .map((c) => DropdownMenuItem(value: c, child: Text(c)))
              .toList(),
          onChanged: onCityChanged,
          dropdownColor: Colors.white,
          elevation: 4,
        ),
      ],
    );
  }
}
