import 'dart:io';

import 'package:book_it/core/storage/token/token_storage.dart';
import 'package:book_it/features/Authentication/data/models/user_model.dart';
import 'package:book_it/features/Authentication/data/services/authentication_service.dart';
import 'package:dio/dio.dart';

class AuthenticationRepo {
  final AuthenticationService _authService = AuthenticationService.instance;

  Future<String?> signUp({
    required String firstName,
    required String lastName,
    required String birthDate,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    required String role,
    required File profilePicture,
    required File idImage,
  }) async {
    try {
      final response = await _authService.signUp(
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
        phoneNumber: phoneNumber,
        password: password,
        confirmPassword: confirmPassword,
        role: role,
        profilePicture: profilePicture,
        idImage: idImage,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return null;
      }

      return "Unexpected server error: ${response.statusCode}";
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        return e.response?.data["message"] ??
            "This Phone number is already registered";
      }

      return "Unexpected error: ${e.response?.statusCode ?? "Network or server error"}";
    } catch (e) {
      return "Network or server error: $e";
    }
  }

  Future<(UserModel?, String?)> signIn({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final response = await _authService.signIn(
        phoneNumber: phoneNumber,
        password: password,
      );

      if (response.statusCode == 200) {
        final token = response.data["token"];
        final userData = response.data["user"];

        if (token != null) {
          await TokenStorage.saveToken(token);
        }

        return (UserModel.fromJson(userData), null);
      }

      return (null, "Unexpected error: ${response.statusCode}");
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final data = e.response?.data;
      if (status == 404 || status == 401) {
        if (data is Map && data['message'] is String) {
          return (null, data['message'] as String);
        }

        if (data is String) {
          return (null, "Server is down or ofline, please try again later");
        }

        return (null, "Request failed");
      }
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return (null, "Server not responding, please try again later");
      }
      if (e.type == DioExceptionType.connectionError) {
        return (null, "No internet connection or Server cant be reached");
      }

      return (
        null,
        "Unexpected error: ${e.response?.statusCode ?? "Network or server error"}",
      );
    } catch (e) {
      return (null, "Network or server error: $e");
    }
  }
}
