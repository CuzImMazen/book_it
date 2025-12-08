import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:book_it/features/Authentication/data/models/user_model.dart';
import 'package:book_it/features/Authentication/data/repo/authentication_repo.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepo _authRepo;

  AuthenticationCubit(this._authRepo) : super(const AuthenticationInitial());

  Future<void> signUp({
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
    emit(const AuthenticationLoading());

    final errorMessage = await _authRepo.signUp(
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

    if (errorMessage == null) {
      emit(const AuthenticationSignUpSuccess());
    } else {
      emit(AuthenticationSignUpFailure(errorMessage));
    }
  }

  Future<void> signIn({
    required String phoneNumber,
    required String password,
  }) async {
    emit(const AuthenticationLoading());

    final (user, errorMessage) = await _authRepo.signIn(
      phoneNumber: phoneNumber,
      password: password,
    );

    if (user != null && errorMessage == null) {
      emit(AuthenticationSignInSuccess(user));
    } else {
      emit(AuthenticationSignInFailure(errorMessage ?? "Unknown error"));
    }
  }
}
