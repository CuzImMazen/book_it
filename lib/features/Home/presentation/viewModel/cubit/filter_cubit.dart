import 'package:bloc/bloc.dart';
import 'package:book_it/features/Home/data/models/filter_model.dart';
import 'package:flutter/material.dart';

class FilterCubit extends Cubit<FilterModel> {
  FilterCubit() : super(const FilterModel());

  void updateLocation({String? governorate, String? city}) {
    emit(state.copyWith(selectedGovernorate: governorate, selectedCity: city));
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

  void updateBedrooms(int? count) {
    emit(state.copyWith(numberOfBedrooms: count));
  }

  void updateBathrooms(int? count) {
    emit(state.copyWith(numberOfBathrooms: count));
  }

  void updateKitchens(int? count) {
    emit(state.copyWith(numberOfKitchens: count));
  }

  void toggleOnlyAvailable(bool? isAvailable) {
    emit(state.copyWith(onlyAvailable: isAvailable ?? false));
  }

  void clearFilters() {
    emit(const FilterModel());
  }

  void applyFilters() {}
}
