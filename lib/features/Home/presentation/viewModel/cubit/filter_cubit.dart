import 'package:book_it/features/Home/data/models/filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<FilterModel> {
  FilterCubit() : super(const FilterModel());

  void updateGovernorate(String? governorate) {
    // Default to "All" if null
    final gov = governorate ?? "All";
    emit(state.copyWith(selectedGovernorate: gov, selectedCity: "All"));
  }

  void updateCity(String? city) {
    emit(state.copyWith(selectedCity: city ?? "All"));
  }

  void updateCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void updatePriceRange(RangeValues newRange) {
    emit(state.copyWith(priceRange: newRange));
  }

  void updateAreaRange(RangeValues newRange) {
    emit(state.copyWith(areaRange: newRange));
  }

  void updateBedrooms(int count) {
    emit(state.copyWith(numberOfBedrooms: count));
  }

  void updateBathrooms(int count) {
    emit(state.copyWith(numberOfBathrooms: count));
  }

  void updateKitchens(int count) {
    emit(state.copyWith(numberOfKitchens: count));
  }

  void toggleOnlyAvailable(bool? isAvailable) {
    emit(state.copyWith(onlyAvailable: isAvailable ?? false));
  }

  void clearFilters() {
    emit(
      const FilterModel(
        selectedGovernorate: "All",
        selectedCity: "All",
        selectedCategory: "All",
        priceRange: RangeValues(25, 250),
        areaRange: RangeValues(100, 1000),
        numberOfBedrooms: 0,
        numberOfBathrooms: 0,
        numberOfKitchens: 0,
        onlyAvailable: false,
      ),
    );
  }

  void applyFilters() {}
}
