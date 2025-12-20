import 'package:book_it/features/Authentication/data/models/user_model.dart';
import 'package:book_it/features/Home/data/models/property_features_model.dart';

class PropertyModel {
  final int id;
  final String name;
  final String category;
  final String description;
  final String price;
  final String governorate;
  final String city;
  final bool availability;
  final String mainImage;
  final List<String>? images;
  final PropertyFeaturesModel? features;
  final UserModel? owner;

  const PropertyModel({
    this.images,
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.governorate,
    required this.city,
    required this.availability,
    required this.mainImage,
    required this.features,
    required this.owner,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      price: json['price_per_day'] as String,
      governorate: json['governorate'] as String,
      city: json['city'] as String,
      availability: json['is_available'] == 1,

      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e['url'].toString())
              .toList() ??
          [],
      mainImage: json['main_image_url'] as String,
      features: json['features'] != null
          ? PropertyFeaturesModel.fromJson(
              json['features'] as Map<String, dynamic>,
            )
          : null,
      owner: json['user'] != null
          ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }
}
