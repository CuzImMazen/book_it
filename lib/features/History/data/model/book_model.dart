import 'package:book_it/features/History/data/model/rating_model.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';

class BookModel {
  BookModel({
    required this.status,
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.property,
    this.rating,
  });
  String status;
  int id;
  String startDate;
  String endDate;
  PropertyModel property;
  RatingModel? rating;

  factory BookModel.fromJson(Map<String, dynamic> json, String status) {
    return BookModel(
      status: status,
      id: json['id'],
      startDate: json['edit_start_date'] ?? json['start_date'],
      endDate: json['edit_end_date'] ?? json['end_date'],
      property: PropertyModel.fromJson(json['property']),
      rating: json['rating'] != null
          ? RatingModel.fromJson(json['rating'])
          : null,
    );
  }

  // factory BookModel.fromJson(Map<String, dynamic> json, String status) {
  //   return BookModel(
  //     status: status,
  //     id: json['id'],
  //     startDate: json['start_date'],
  //     endDate: json['end_date'],
  //     property: PropertyModel.fromJson(json['property']),
  //   );
  // }

  // factory BookModel.fromJson2(Map<String, dynamic> json, String status) {
  //   return BookModel(
  //     status: status,
  //     id: json['id'],
  //     startDate: json['edit_start_date'],
  //     endDate: json['edit_end_date'],
  //     property: PropertyModel.fromJson(json['property']),
  //   );
  // }
  BookModel copyWith({
    String? status,
    int? id,
    String? startDate,
    String? endDate,
    PropertyModel? property,
  }) {
    return BookModel(
      status: status ?? this.status,
      id: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      property: property ?? this.property,
    );
  }
}
