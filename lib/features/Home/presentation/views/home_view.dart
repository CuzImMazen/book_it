import 'package:book_it/core/error/property_error_mapper.dart';
import 'package:book_it/core/style/colors.dart';

import 'package:book_it/features/Home/presentation/viewModel/cubit/property_cubit.dart';
import 'package:book_it/features/Home/presentation/widgets/category_selector.dart';
import 'package:book_it/features/Home/presentation/widgets/filter_button_row.dart';
import 'package:book_it/features/Home/presentation/widgets/property_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          FilterButtonRow(),
          SizedBox(height: 20),
          CategorySelector(),
          SizedBox(height: 20),

          Expanded(
            child: BlocBuilder<PropertyCubit, PropertyState>(
              builder: (context, state) {
                if (state is PropertyInitial) {
                  return const Center(
                    child: CircularProgressIndicator(color: kPrimaryColor),
                  );
                }
                if (state is PropertyLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: kPrimaryColor),
                  );
                } else if (state is PropertyErrorState) {
                  return Center(child: Text(state.error.localized(context)));
                } else if (state is PropertyLoaded) {
                  if (state.properties.isEmpty) {
                    return const Center(child: Text("No properties found"));
                  }
                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: state.properties.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.push(
                            '/main/propertydetail',
                            extra: state.properties[index],
                          );
                        },
                        child: PropertyContainer(
                          forOwner: false,
                          property: state.properties[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                  );
                } else {
                  return const Center(child: Text("Error"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
