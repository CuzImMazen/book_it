import 'package:flutter/material.dart';

class FilterModel {
  final RangeValues priceRange;
  final RangeValues areaRange;
  final String? selectedGovernorate;
  final String? selectedCity;
  final String selectedCategory;
  final bool onlyAvailable;
  final int? numberOfBedrooms;
  final int? numberOfBathrooms;
  final int? numberOfKitchens;

  const FilterModel({
    this.priceRange = const RangeValues(25, 250),
    this.areaRange = const RangeValues(100, 1000),
    this.onlyAvailable = false,
    this.selectedGovernorate,
    this.selectedCity,
    this.selectedCategory = "All",
    this.numberOfBedrooms,
    this.numberOfBathrooms,
    this.numberOfKitchens,
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
}
