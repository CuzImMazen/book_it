part of 'authentication_cubit.dart';

abstract class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}

// Sign Up
class AuthenticationSignUpSuccess extends AuthenticationState {
  const AuthenticationSignUpSuccess();
}

class AuthenticationSignUpFailure extends AuthenticationState {
  final String message;
  const AuthenticationSignUpFailure(this.message);
}

// Sign In
class AuthenticationSignInSuccess extends AuthenticationState {
  final UserModel user;
  const AuthenticationSignInSuccess(this.user);
}

class AuthenticationSignInFailure extends AuthenticationState {
  final String message;
  const AuthenticationSignInFailure(this.message);
}

// Sign Out
class AuthenticationSignOutSuccess extends AuthenticationState {
  const AuthenticationSignOutSuccess();
}

class AuthenticationSignOutFailure extends AuthenticationState {
  final String message;
  const AuthenticationSignOutFailure(this.message);
}
