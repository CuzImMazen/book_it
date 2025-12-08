class UserModel {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.phoneNumber,
    required this.role,
    required this.profileImage,
    required this.idImage,
  });
  int? id;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? phoneNumber;
  String? role;
  String? profileImage;
  String? idImage;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      birthDate: json['date_of_birth'],
      phoneNumber: json['phone_number'],
      role: json['role'],
      profileImage: json['profile_img_url'],
      idImage: json['id_img_url'],
    );
  }
  UserModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? birthDate,
    String? phoneNumber,
    String? role,
    String? profileImage,
    String? idImage,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
      profileImage: profileImage ?? this.profileImage,
      idImage: idImage ?? this.idImage,
    );
  }
}
