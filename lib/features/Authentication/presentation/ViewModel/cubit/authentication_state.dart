part of 'authentication_cubit.dart';

sealed class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}

class AuthenticationSignUpSuccess extends AuthenticationState {
  const AuthenticationSignUpSuccess();
}

class AuthenticationSignUpFailure extends AuthenticationState {
  final AuthError error;

  const AuthenticationSignUpFailure(this.error);
}

class AuthenticationSignInSuccess extends AuthenticationState {
  final UserModel user;

  const AuthenticationSignInSuccess(this.user);
}

class AuthenticationSignInFailure extends AuthenticationState {
  final AuthError error;

  const AuthenticationSignInFailure(this.error);
}

class AuthenticationSignOutSuccess extends AuthenticationState {
  const AuthenticationSignOutSuccess();
}

class AuthenticationSignOutFailure extends AuthenticationState {
  final AuthError error;

  const AuthenticationSignOutFailure(this.error);
}
