import 'dart:io';
import 'package:book_it/core/api/api.dart';
import 'package:dio/dio.dart';

class AuthenticationService {
  static final AuthenticationService _instance =
      AuthenticationService._internal();
  static AuthenticationService get instance => _instance;

  AuthenticationService._internal();

  final Dio _dio = Api.instance.dio;

  Future<Response> signUp({
    required String firstName,
    required String lastName,
    required String birthDate,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    required String role,
    required File profilePicture,
    required File idImage,
    required String fcmToken,
  }) async {
    if (!profilePicture.existsSync() || !idImage.existsSync()) {
      throw Exception("Profile picture or ID image not found");
    }

    final formData = FormData.fromMap({
      "first_name": firstName,
      "last_name": lastName,
      "date_of_birth": birthDate,
      "phone_number": phoneNumber,
      "password": password,
      "password_confirmation": confirmPassword,
      "role": role,
      "fcm_token": fcmToken,
      "profile_img": await MultipartFile.fromFile(
        profilePicture.path,
        filename: profilePicture.path.split('/').last,
      ),
      "id_img": await MultipartFile.fromFile(
        idImage.path,
        filename: idImage.path.split('/').last,
      ),
    });

    return await _dio.post(
      "/signUp",

      data: formData,
      options: Options(
        extra: {"requiresToken": false},
        contentType: "multipart/form-data",
      ),
    );
  }

  Future<Response> signIn({
    required String phoneNumber,
    required String password,
  }) async {
    return await _dio.post(
      "/signIn",
      data: {"phone_number": phoneNumber, "password": password},
      options: Options(extra: {"requiresToken": false}),
    );
  }

  Future<Response> signOut() async {
    return await _dio.post("/signOut");
  }
}
