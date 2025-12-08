import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Home/presentation/widgets/feature_container.dart';
import 'package:flutter/material.dart';

class PropertyFeaturesScroller extends StatelessWidget {
  const PropertyFeaturesScroller({super.key, required this.property});

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PropertyFeatureContainer(
            icon: Icons.apartment,
            data: '${property.area} m²',
          ),
          PropertyFeatureContainer(
            icon: Icons.bathtub,
            data: "${property.numberOfBaths} Bath",
          ),
          PropertyFeatureContainer(
            icon: Icons.bed,
            data: "${property.numberOfBedrooms} Bedroom",
          ),
          PropertyFeatureContainer(
            icon: Icons.kitchen,
            data: " ${property.numberOfKitchens} Kitchen",
          ),
        ],
      ),
    );
  }
}
