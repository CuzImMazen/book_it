import 'package:book_it/features/Authentication/data/models/first_signup_data.dart';
import 'package:book_it/features/Authentication/presentation/widgets/second_signup_form.dart';
import 'package:flutter/material.dart';

class SecondSignUpView extends StatelessWidget {
  const SecondSignUpView({super.key, required this.firstSignupData});
  final FirstSignupData firstSignupData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SecondSignupForm(firstSignupData: firstSignupData));
  }
}
