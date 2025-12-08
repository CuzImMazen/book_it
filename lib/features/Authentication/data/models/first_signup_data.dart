import 'dart:io';

class FirstSignupData {
  FirstSignupData({
    required this.name,
    required this.lastName,
    required this.birthDate,
    required this.profileImage,
    required this.idImage,
  });
  String? name;
  String? lastName;
  String? birthDate;
  File? profileImage;
  File? idImage;
}
