import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:book_it/core/utils/location_localization.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:flutter/material.dart';

class DetailPageLocationRow extends StatelessWidget {
  const DetailPageLocationRow({super.key, required this.property});

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${localizedGovernorate(context, property.governorate)}, "
          "${localizedCity(context, property.governorate, property.city)}",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Spacer(),
        Text(
          "\$${context.home.detail_pricePerNight(property.price)}",
          style: TextStyle(
            color: Colors.amber.shade800,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
