class PropertyFeaturesModel {
  const PropertyFeaturesModel({
    required this.numberOfKitchens,
    required this.numberOfBathrooms,
    required this.numberOfBedrooms,
    required this.area,
  });
  final int numberOfKitchens;
  final int numberOfBathrooms;
  final int numberOfBedrooms;
  final double area;

  factory PropertyFeaturesModel.fromJson(Map<String, dynamic> json) {
    return PropertyFeaturesModel(
      numberOfKitchens: json['kitchens'] as int,
      numberOfBathrooms: json['bathrooms'] as int,
      numberOfBedrooms: json['rooms'] as int,
      area: json['area'] as double,
    );
  }
}
