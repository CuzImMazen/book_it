import 'package:book_it/features/Home/presentation/widgets/category_selector.dart';
import 'package:book_it/features/Home/presentation/widgets/filter_button_row.dart';
import 'package:book_it/features/Home/presentation/widgets/property_container.dart';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          FilterButtonRow(),
          SizedBox(height: 20),
          CatgeorySelector(),
          SizedBox(height: 20),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: 5,
              itemBuilder: (context, index) {
                return PropertyContainer();
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
          ),
        ],
      ),
    );
  }
}
