import 'package:book_it/features/Home/data/models/location_model.dart';
import 'package:book_it/features/Home/data/models/owner_model.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Home/presentation/widgets/category_selector.dart';
import 'package:book_it/features/Home/presentation/widgets/filter_button_row.dart';
import 'package:book_it/features/Home/presentation/widgets/property_container.dart';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  final PropertyModel testProperty = const PropertyModel(
    name: "Fancy House",
    category: "house",
    description:
        "A stunning, modern mansion featuring elegant architecture and spacious interiors. Large windows fill the home with natural light, highlighting premium finishes and high-end amenities. Surrounded by beautifully landscaped gardens, it offers luxury, comfort, and style in every detail.",
    price: "250.000",
    location: Location(city: "AlShalaan", governorate: "Damascus"),
    availability: true,
    mainImage: "assets/images/house5.avif",
    numberOfKitchens: 2,
    numberOfBaths: 2,
    numberOfBedrooms: 4,
    area: 500,
    owner: OwnerModel(
      image: "assets/images/profile.jpg",
      firstName: "Mazen",
      lastName: "Alrefai",
      phone: "0947476626",
    ),
    images: [
      "assets/images/house5.avif",
      "assets/images/inside1.jpg",
      "assets/images/inside2.jpg",
      "assets/images/inside3.jpg",
    ],
  );
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
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: 5,
              itemBuilder: (context, index) {
                return PropertyContainer(property: testProperty);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
          ),
        ],
      ),
    );
  }
}
