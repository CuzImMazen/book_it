String? phoneValidator(String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return "Please enter your phone number";
  }
  if (value.length != 10) {
    return "Phone number must be 10 characters";
  }
  if (!value.startsWith("09")) {
    return "Please enter a valid phone number";
  }
  return null;
}

String? passwordValidator(String? value) {
  value = value?.trim();

  if (value == null || value.isEmpty) {
    return "Please enter your password";
  }
  if (value.length < 8) {
    return "Password must be at least 8 characters";
  }
  return null;
}

String? nameValidator(String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return "Please enter your name";
  }
  if (value.length > 20) {
    return "That name is too long";
  }
  return null;
}

String? confirmPasswordValidator(String? value, String password) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return "Please confirm your password";
  }
  if (value != password.trim()) {
    return "Passwords do not match";
  }
  return null;
}

String? dateOfBirthValidator(String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return "Please Enter your birth date";
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
