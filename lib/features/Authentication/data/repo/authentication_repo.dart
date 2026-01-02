import 'dart:io';
import 'package:book_it/core/storage/token/token_storage.dart';
import 'package:book_it/features/Authentication/data/models/user_model.dart';
import 'package:book_it/features/Authentication/data/services/authentication_service.dart';
import 'package:dio/dio.dart';

enum AuthError {
  phoneAlreadyRegistered,
  invalidPassword,
  accountNotApproved,
  phoneNotRegistered,
  networkError,
  serverError,
  unknown,
}

class AuthenticationRepo {
  final AuthenticationService _authService = AuthenticationService.instance;

  /// Sign Up
  Future<AuthError?> signUp({
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

      if (response.statusCode == 200 || response.statusCode == 201) return null;

      return AuthError.unknown;
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 422) return AuthError.phoneAlreadyRegistered;
      if (status == 403) return AuthError.accountNotApproved;

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.connectionError) {
        return AuthError.networkError;
      }

      return AuthError.unknown;
    } catch (_) {
      return AuthError.unknown;
    }
  }

  Future<(UserModel?, AuthError?)> signIn({
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
        if (token != null) await TokenStorage.saveToken(token);
        return (UserModel.fromJson(userData), null);
      }

      return (null, AuthError.unknown);
    } on DioException catch (e) {
      final status = e.response?.statusCode;

      if (status == 403) return (null, AuthError.accountNotApproved);
      if (status == 404) return (null, AuthError.phoneNotRegistered);
      if (status == 401) return (null, AuthError.invalidPassword);

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.connectionError) {
        return (null, AuthError.networkError);
      }

      return (null, AuthError.unknown);
    } catch (_) {
      return (null, AuthError.unknown);
    }
  }

  /// Sign Out
  Future<AuthError?> signOut() async {
    try {
      final response = await _authService.signOut();
      if (response.statusCode == 200) return null;

      return AuthError.unknown;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.connectionError) {
        return AuthError.networkError;
      }
      return AuthError.unknown;
    } catch (_) {
      return AuthError.unknown;
    }
  }
}
