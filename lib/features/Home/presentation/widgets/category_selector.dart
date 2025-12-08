import 'package:book_it/features/Home/presentation/widgets/category_container.dart';
import 'package:flutter/material.dart';

class CatgeorySelector extends StatelessWidget {
  const CatgeorySelector({super.key});
  final List<String> categories = const ["All", "House", "Villa", "Apartment"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        itemCount: categories.length,
        itemBuilder: (context, index) =>
            CategoryContainer(text: categories[index]),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
