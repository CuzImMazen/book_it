import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/filter_cubit.dart';
import 'package:book_it/features/Home/presentation/widgets/drop_down_button_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationFilters extends StatelessWidget {
  final String? selectedGovernorate;
  final String? selectedCity;

  const LocationFilters({
    super.key,
    this.selectedGovernorate,
    this.selectedCity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropDownButtonRow(
          hintText: "Governorate",
          text: "Governorate :",
          items: getGovernorates(),
          currentValue: selectedGovernorate,
          onChanged: (value) {
            if (value == "All") {
              context.read<FilterCubit>().updateLocation(
                governorate: "All",
                city: null,
              );
            } else {
              context.read<FilterCubit>().updateLocation(
                governorate: value,
                city: null,
              );
            }
          },
        ),
        const SizedBox(height: 10),

        DropDownButtonRow(
          hintText: "Select City",
          text: "Choose a City :",
          items: getCities(selectedGovernorate),
          currentValue: selectedCity,
          onChanged: (value) =>
              context.read<FilterCubit>().updateLocation(city: value),
        ),
      ],
    );
  }
}
