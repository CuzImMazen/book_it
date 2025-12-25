import 'package:book_it/core/style/colors.dart';
import 'package:book_it/features/Home/presentation/widgets/property_container.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPropertiesBody extends StatelessWidget {
  const MyPropertiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnerPropertiesCubit, OwnerPropertiesState>(
      builder: (context, state) {
        if (state is OwnerPropertiesLoading) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        }
        if (state is OwnerPropertiesError) {
          return Center(child: Text(state.message));
        }
        if (state is OwnerPropertiesLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.properties.length,
                    itemBuilder: (context, index) {
                      return PropertyContainer(
                        forOwner: true,
                        property: state.properties[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(child: Text("Error"));
      },
    );
  }
}
