import 'package:flutter/material.dart';

class FilterModel {
  final RangeValues priceRange;
  final RangeValues areaRange;
  final String? selectedGovernorate;
  final String? selectedCity;
  final String selectedCategory;
  final bool onlyAvailable;
  final int numberOfBedrooms;
  final int numberOfBathrooms;
  final int numberOfKitchens;

  const FilterModel({
    this.priceRange = const RangeValues(25, 250),
    this.areaRange = const RangeValues(100, 1000),
    this.onlyAvailable = false,
    this.selectedGovernorate,
    this.selectedCity,
    this.selectedCategory = "All",
    this.numberOfBedrooms = 0,
    this.numberOfBathrooms = 0,
    this.numberOfKitchens = 0,
  });

  FilterModel copyWith({
    RangeValues? priceRange,
    RangeValues? areaRange,
    String? selectedGovernorate,
    String? selectedCity,
    String? selectedCategory,
    bool? onlyAvailable,
    int? numberOfBedrooms,
    int? numberOfBathrooms,
    int? numberOfKitchens,
  }) {
    return FilterModel(
      priceRange: priceRange ?? this.priceRange,
      areaRange: areaRange ?? this.areaRange,
      selectedGovernorate: selectedGovernorate ?? this.selectedGovernorate,
      selectedCity: selectedCity ?? this.selectedCity,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      onlyAvailable: onlyAvailable ?? this.onlyAvailable,
      numberOfBedrooms: numberOfBedrooms ?? this.numberOfBedrooms,
      numberOfBathrooms: numberOfBathrooms ?? this.numberOfBathrooms,
      numberOfKitchens: numberOfKitchens ?? this.numberOfKitchens,
    );
  }

  Map<String, String> toQueryParameters() {
    final Map<String, String> params = {};

    if (selectedGovernorate != null &&
        selectedGovernorate!.isNotEmpty &&
        selectedGovernorate != "All") {
      params['governorate'] = selectedGovernorate!;
    }

    if (selectedCity != null &&
        selectedCity!.isNotEmpty &&
        selectedCity != "All") {
      params['city'] = selectedCity!;
    }

    if (selectedCategory != "All") {
      params['category'] = selectedCategory;
    }

    if (!(priceRange.start == 25 && priceRange.end == 250)) {
      params['priceMin'] = priceRange.start.toInt().toString();
      params['priceMax'] = priceRange.end.toInt().toString();
    }

    if (!(areaRange.start == 100 && areaRange.end == 1000)) {
      params['areaMin'] = areaRange.start.toInt().toString();
      params['areaMax'] = areaRange.end.toInt().toString();
    }

    if (numberOfBedrooms > 0) params['bedrooms'] = numberOfBedrooms.toString();
    if (numberOfBathrooms > 0)
      params['bathrooms'] = numberOfBathrooms.toString();

    if (numberOfKitchens > 0) params['kitchens'] = numberOfKitchens.toString();

    if (onlyAvailable) params['onlyAvailable'] = 'true';

    return params;
  }
}
