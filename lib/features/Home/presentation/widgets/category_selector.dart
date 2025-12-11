import 'package:book_it/features/Home/data/models/filter_model.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_container.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  final List<String> categories = const ["All", "House", "Villa", "Apartment"];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterModel>(
      builder: (context, state) {
        final selectedCategory = state.selectedCategory;

        return SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final category = categories[index];

              final isSelected = category == selectedCategory;

              return CategoryContainer(
                text: category,
                isSelected: isSelected,
                onTap: () {
                  context.read<FilterCubit>().updateCategory(category);
                },
              );
            },
          ),
        );
      },
    );
  }
}
