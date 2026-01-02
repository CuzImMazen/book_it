import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

String? phoneValidator(BuildContext context, String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.auth.errPhoneEmpty;
  }
  if (value.length != 10) {
    return context.auth.errPhoneLength;
  }
  if (!value.startsWith("09")) {
    return context.auth.errPhoneInvalid;
  }
  return null;
}

String? passwordValidator(BuildContext context, String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.auth.errPasswordEmpty;
  }
  if (value.length < 8) {
    return context.auth.errPasswordLength;
  }
  return null;
}

String? nameValidator(BuildContext context, String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.auth.errNameEmpty;
  }
  if (value.length > 20) {
    return context.auth.errNameTooLong;
  }
  return null;
}

String? confirmPasswordValidator(
  BuildContext context,
  String? value,
  String password,
) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.auth.errConfirmPasswordEmpty;
  }
  if (value != password.trim()) {
    return context.auth.errPasswordsNotMatch;
  }
  return null;
}

String? dateOfBirthValidator(BuildContext context, String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.auth.errBirthDateEmpty;
  }
  return null;
}

String? cardNumberValidator(String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return "Please enter your card number";
  }
  if (value.length < 12) {
    return "Card number must be at least 12 characters";
  }
  if (value.length > 19) {
    return "Card number cant be more than 19 characters";
  }
  return null;
}

String? addressValidator(String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return "Please enter your billing address";
  }
  return null;
}

String? startDateValidator(String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return "Please enter your start date";
  }
  return null;
}

String? endDateValidator(String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return "Please enter your end date";
  }

  return null;
}

String? priceValidator(String? value) {
  if (value == null || value.isEmpty) return "Required";
  final intValue = int.tryParse(value);
  if (intValue == null) return "Must be a number";
  if (intValue < 25 || intValue > 250) return "Price : 25–250 \$";
  return null;
}

String? areaValidator(String? value) {
  if (value == null || value.isEmpty) return "Required";
  final intValue = int.tryParse(value);
  if (intValue == null) return "Must be a number";
  if (intValue < 100 || intValue > 1000) return "Area : 100–1000 m²";
  return null;
}
