import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:flutter/material.dart';

class DetailPageLocationRow extends StatelessWidget {
  const DetailPageLocationRow({super.key, required this.property});

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          Text(
            "${property.governorate}, ${property.city}",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Spacer(),
          Text(
            "\$${property.price}/Night",
            style: TextStyle(
              color: Colors.amber.shade800,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
