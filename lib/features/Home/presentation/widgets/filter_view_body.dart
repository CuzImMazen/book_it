import 'dart:developer';

import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Home/data/models/filter_model.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/filter_cubit.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/property_cubit.dart';
import 'package:book_it/features/Home/presentation/widgets/apply_filters_button.dart';
import 'package:book_it/features/Home/presentation/widgets/drop_down_button_row.dart';
import 'package:book_it/features/Home/presentation/widgets/feature_counter_row.dart';
import 'package:book_it/features/Home/presentation/widgets/only_available_properties_row.dart';
import 'package:book_it/features/Home/presentation/widgets/range_slider_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FilterViewBody extends StatelessWidget {
  const FilterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => showDiscardFiltersDialog(context),
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              BlocSelector<FilterCubit, FilterModel, String?>(
                selector: (state) => state.selectedGovernorate,
                builder: (context, selectedGovernorate) {
                  return DropDownButtonRow(
                    text: "Governorate :",
                    hintText: "Select Governorate",
                    items: getGovernorates(),
                    currentValue: selectedGovernorate,
                    onChanged: (value) {
                      context.read<FilterCubit>().updateGovernorate(value);
                    },
                  );
                },
              ),

              const SizedBox(height: 10),

              BlocBuilder<FilterCubit, FilterModel>(
                buildWhen: (prev, curr) =>
                    prev.selectedGovernorate != curr.selectedGovernorate ||
                    prev.selectedCity != curr.selectedCity,
                builder: (context, state) {
                  final gov = state.selectedGovernorate;
                  final cities = getCities(gov);

                  final currentCity =
                      (state.selectedCity != null &&
                          cities.contains(state.selectedCity))
                      ? state.selectedCity
                      : null;

                  return DropDownButtonRow(
                    text: "Choose a City :",
                    hintText: "Select City",
                    items: cities,
                    currentValue: currentCity,
                    onChanged: (value) =>
                        context.read<FilterCubit>().updateCity(value),
                  );
                },
              ),

              const SizedBox(height: 10),

              BlocSelector<FilterCubit, FilterModel, RangeValues>(
                selector: (state) => state.priceRange,
                builder: (context, priceRange) {
                  return RangeSliderContainer(
                    text: "Price :",
                    min: 25,
                    max: 250,
                    divisions: 22,
                    unit: "\$",
                    currentRange: priceRange,
                    onChanged: (range) {
                      context.read<FilterCubit>().updatePriceRange(range);
                    },
                  );
                },
              ),

              const SizedBox(height: 10),

              BlocSelector<FilterCubit, FilterModel, RangeValues>(
                selector: (state) => state.areaRange,
                builder: (context, areaRange) {
                  return RangeSliderContainer(
                    text: "Area :",
                    min: 100,
                    max: 1000,
                    divisions: 18,
                    unit: "m²",
                    currentRange: areaRange,
                    onChanged: (range) {
                      context.read<FilterCubit>().updateAreaRange(range);
                    },
                  );
                },
              ),

              const SizedBox(height: 10),

              BlocSelector<FilterCubit, FilterModel, int>(
                selector: (state) => state.numberOfBedrooms,
                builder: (context, bedrooms) {
                  return FeatureCounterRow(
                    text: "Num of Bedrooms :",
                    value: bedrooms,
                    onChanged: (val) {
                      context.read<FilterCubit>().updateBedrooms(val);
                    },
                  );
                },
              ),

              const SizedBox(height: 10),

              BlocSelector<FilterCubit, FilterModel, int>(
                selector: (state) => state.numberOfBathrooms,
                builder: (context, bathrooms) {
                  return FeatureCounterRow(
                    text: "Num of Bathrooms :",
                    value: bathrooms,
                    onChanged: (val) {
                      context.read<FilterCubit>().updateBathrooms(val);
                    },
                  );
                },
              ),

              const SizedBox(height: 10),

              BlocSelector<FilterCubit, FilterModel, int>(
                selector: (state) => state.numberOfKitchens,
                builder: (context, kitchens) {
                  return FeatureCounterRow(
                    text: "Num of Kitchens :",
                    value: kitchens,
                    onChanged: (val) {
                      context.read<FilterCubit>().updateKitchens(val);
                    },
                  );
                },
              ),

              const SizedBox(height: 15),

              BlocSelector<FilterCubit, FilterModel, bool>(
                selector: (state) => state.onlyAvailable,
                builder: (context, available) {
                  return OnlyAvailablePropertiesRow(
                    onlyAvailable: available,
                    onChanged: (val) {
                      context.read<FilterCubit>().toggleOnlyAvailable(val);
                    },
                  );
                },
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  final filterState = context.read<FilterCubit>().state;
                  final queryParams = filterState.toQueryParameters();
                  context.read<PropertyCubit>().getProperties(queryParams);
                  log(queryParams.toString());
                  context.pop();
                },
                child: const ApplyFiltersButton(),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
