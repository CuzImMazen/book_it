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
