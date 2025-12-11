import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Home/data/models/filter_model.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/filter_cubit.dart';
import 'package:book_it/features/Home/presentation/widgets/apply_filters_button.dart';
import 'package:book_it/features/Home/presentation/widgets/feature_counter_row.dart';
import 'package:book_it/features/Home/presentation/widgets/location_filters_column.dart';
import 'package:book_it/features/Home/presentation/widgets/only_available_properties_row.dart';
import 'package:book_it/features/Home/presentation/widgets/range_slider_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FilterViewBody extends StatelessWidget {
  const FilterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterModel>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Spacer(),
                      const Text(
                        "Filters",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => showDiscardFiltersDialog(context),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  LocationFilters(
                    selectedGovernorate: state.selectedGovernorate,
                    selectedCity: state.selectedCity,
                  ),
                  const SizedBox(height: 10),

                  RangeSliderContainer(
                    text: "Price :",
                    min: 25,
                    max: 250,
                    divisions: 22,
                    unit: "\$",
                    currentRange: state.priceRange,
                    onChanged: (range) =>
                        context.read<FilterCubit>().updatePriceRange(range),
                  ),
                  const SizedBox(height: 10),

                  RangeSliderContainer(
                    text: "Area :",
                    min: 100,
                    max: 1000,
                    divisions: 18,
                    unit: "m²",
                    currentRange: state.areaRange,
                    onChanged: (range) =>
                        context.read<FilterCubit>().updateAreaRange(range),
                  ),
                  const SizedBox(height: 10),

                  FeatureCounterRow(
                    text: "Num of Bedrooms :",
                    value: state.numberOfBedrooms,
                    onChanged: (val) =>
                        context.read<FilterCubit>().updateBedrooms(val),
                  ),
                  const SizedBox(height: 10),
                  FeatureCounterRow(
                    text: " Num of Bathrooms :",
                    value: state.numberOfBathrooms,

                    onChanged: (val) =>
                        context.read<FilterCubit>().updateBathrooms(val),
                  ),
                  const SizedBox(height: 10),
                  FeatureCounterRow(
                    text: " Num of Kitchens:",
                    value: state.numberOfKitchens,
                    onChanged: (val) =>
                        context.read<FilterCubit>().updateKitchens(val),
                  ),
                  const SizedBox(height: 15),

                  OnlyAvailablePropertiesRow(
                    onlyAvailable: state.onlyAvailable,
                    onChanged: (val) =>
                        context.read<FilterCubit>().toggleOnlyAvailable(val),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      final filter = context.read<FilterCubit>().state;
                      print("Current filter state:");
                      print("Governorate: ${filter.selectedGovernorate}");
                      print("City: ${filter.selectedCity}");
                      print(
                        "Price: ${filter.priceRange.start}-${filter.priceRange.end}",
                      );
                      print(
                        "Area: ${filter.areaRange.start}-${filter.areaRange.end}",
                      );
                      print("Bedrooms: ${filter.numberOfBedrooms}");
                      print("Bathrooms: ${filter.numberOfBathrooms}");
                      print("Kitchens: ${filter.numberOfKitchens}");
                      print("Only Available: ${filter.onlyAvailable}");
                      print("Category: ${filter.selectedCategory}");
                    },
                    child: const ApplyFiltersButton(),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
