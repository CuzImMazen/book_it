part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {
  const AuthenticationState();
}

final class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

final class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}

final class AuthenticationSignUpSuccess extends AuthenticationState {
  const AuthenticationSignUpSuccess();
}

final class AuthenticationSignInSuccess extends AuthenticationState {
  final UserModel user;
  const AuthenticationSignInSuccess(this.user);
  AuthenticationSignInSuccess copyWith({UserModel? user}) {
    return AuthenticationSignInSuccess(user ?? this.user);
  }
}

final class AuthenticationSignUpFailure extends AuthenticationState {
  final String message;
  const AuthenticationSignUpFailure(this.message);
}

final class AuthenticationSignInFailure extends AuthenticationState {
  final String message;
  const AuthenticationSignInFailure(this.message);
}
