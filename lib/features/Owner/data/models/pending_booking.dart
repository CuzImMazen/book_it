import 'package:book_it/features/Authentication/data/models/user_model.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';

class PendingBookingModel {
  final int id;
  final String startDate;
  final String endDate;
  final PropertyModel property;
  final UserModel user;
  final String price;

  PendingBookingModel({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.property,
    required this.user,
    required this.price,
  });
  factory PendingBookingModel.fromJson(Map<String, dynamic> json) {
    return PendingBookingModel(
      id: json['id'] as int,
      price: json['price'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      property: PropertyModel.fromJson(
        json['property'] as Map<String, dynamic>,
      ),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
