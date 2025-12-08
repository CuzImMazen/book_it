import 'package:book_it/features/Home/data/models/location_model.dart';
import 'package:book_it/features/Home/data/models/owner_model.dart';

class PropertyModel {
  final String name;
  final String description;
  final String price;
  final Location location;
  final bool availability;
  final String mainImage;
  final List<String>? images;
  final int numberOfKitchens;
  final int numberOfBaths;
  final int numberOfBedrooms;
  final double area;
  final OwnerModel owner;

  const PropertyModel({
    this.images,
    required this.name,
    required this.description,
    required this.price,
    required this.location,
    required this.availability,
    required this.mainImage,
    required this.numberOfKitchens,
    required this.numberOfBaths,
    required this.numberOfBedrooms,
    required this.area,
    required this.owner,
  });
}
