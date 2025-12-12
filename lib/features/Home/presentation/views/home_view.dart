import 'package:book_it/features/Authentication/data/models/user_model.dart';
import 'package:book_it/features/Home/data/models/property_features_model.dart';

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
    governorate: "Damascus",
    city: "Al-Shalaan",
    availability: true,
    mainImage: "assets/images/house5.avif",
    features: PropertyFeaturesModel(
      numberOfKitchens: 2,
      numberOfBathrooms: 2,
      numberOfBedrooms: 3,
      area: 100,
    ),
    owner: UserModel(
      id: 1,
      profileImage: "assets/images/profile.jpg",
      firstName: "Mazen",
      lastName: "Alrefai",
      phoneNumber: "0947476626",
      birthDate: "1995-01-01",
      role: "Owner",
      idImage: "assets/images/id.jpg",
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
