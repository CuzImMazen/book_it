import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:flutter/material.dart';

class DetailPageNameRow extends StatelessWidget {
  const DetailPageNameRow({super.key, required this.property});

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          property.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
        Spacer(),
        property.availability
            ? Text(
                "Available",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.w900,
                ),
              )
            : Text(
                "Unavailable",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ],
    );
  }
}
