import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Home/presentation/widgets/detail_view_body.dart';
import 'package:flutter/material.dart';

class PropertyDetailView extends StatelessWidget {
  const PropertyDetailView({super.key, required this.property});
  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DetailViewBody(property: property));
  }
}
