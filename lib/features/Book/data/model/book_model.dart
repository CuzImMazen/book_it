import 'package:book_it/features/Home/data/models/property_model.dart';

class BookModel {
  BookModel({
    required this.status,
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.property,
  });
  String status;
  int id;
  String startDate;
  String endDate;
  PropertyModel property;
}

BookModel bookModelFromJson(Map<String, dynamic> json) {
  return BookModel(
    status: json['status'],
    id: json['id'],
    startDate: json['start_date'],
    endDate: json['end_date'],
    property: PropertyModel.fromJson(json['property']),
  );
}
