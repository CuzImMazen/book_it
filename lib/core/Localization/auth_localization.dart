import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:flutter/widgets.dart';

class AuthLocalization {
  final String errPhoneAlreadyRegistered;
  final String errInvalidPassword;
  final String errAccountNotApproved;
  final String errPhoneNotRegistered;
  final String errNoInternet;
  final String errServerOffline;
  final String errUnexpected;
  final String authSignedInSuccess;

  AuthLocalization({
    required this.errPhoneAlreadyRegistered,
    required this.errInvalidPassword,
    required this.errAccountNotApproved,
    required this.errPhoneNotRegistered,
    required this.errNoInternet,
    required this.errServerOffline,
    required this.errUnexpected,
    required this.authSignedInSuccess,
  });

  factory AuthLocalization.fromContext(BuildContext context) {
    return AuthLocalization(
      errPhoneAlreadyRegistered: context.auth.errPhoneAlreadyRegistered,
      errInvalidPassword: context.auth.errInvalidPassword,
      errAccountNotApproved: context.auth.errAccountNotApproved,
      errPhoneNotRegistered: context.auth.errPhoneNotRegistered,
      errNoInternet: context.auth.errNoInternet,
      errServerOffline: context.auth.errServerOffline,
      errUnexpected: context.auth.errUnexpected,
      authSignedInSuccess: context.auth.auth_signedInSuccess,
    );
  }
}
