import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:book_it/core/Localization/auth_localization.dart';
import 'package:book_it/features/Authentication/data/models/user_model.dart';
import 'package:book_it/features/Authentication/data/repo/authentication_repo.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepo _authRepo;
  final AuthLocalization _loc; // injected localization

  AuthenticationCubit(this._authRepo, this._loc)
    : super(const AuthenticationInitial());

  String _mapErrorToMessage(AuthError error) {
    switch (error) {
      case AuthError.phoneAlreadyRegistered:
        return _loc.errPhoneAlreadyRegistered;
      case AuthError.invalidPassword:
        return _loc.errInvalidPassword;
      case AuthError.accountNotApproved:
        return _loc.errAccountNotApproved;

      case AuthError.phoneNotRegistered:
        return _loc.errPhoneNotRegistered;
      case AuthError.networkError:
        return _loc.errNoInternet;
      case AuthError.serverError:
        return _loc.errServerOffline;

      case AuthError.unknown:
        return _loc.errUnexpected;
    }
  }

  /// Sign Up
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

    final error = await _authRepo.signUp(
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

    if (error == null) {
      emit(const AuthenticationSignUpSuccess());
    } else {
      emit(AuthenticationSignUpFailure(_mapErrorToMessage(error)));
    }
  }

  /// Sign In
  Future<void> signIn({
    required String phoneNumber,
    required String password,
  }) async {
    emit(const AuthenticationLoading());

    final (user, error) = await _authRepo.signIn(
      phoneNumber: phoneNumber,
      password: password,
    );

    if (user != null) {
      emit(AuthenticationSignInSuccess(user));
    } else {
      emit(
        AuthenticationSignInFailure(
          _mapErrorToMessage(error ?? AuthError.unknown),
        ),
      );
    }
  }

  /// Sign Out
  Future<void> signOut() async {
    emit(const AuthenticationLoading());

    final error = await _authRepo.signOut();

    if (error == null) {
      emit(const AuthenticationSignOutSuccess());
    } else {
      emit(AuthenticationSignOutFailure(_mapErrorToMessage(error)));
    }
  }
}
