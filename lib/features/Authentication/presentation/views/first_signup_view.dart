import 'package:book_it/features/Authentication/presentation/widgets/first_signup_form.dart';
import 'package:flutter/material.dart';

class FirstSignUpView extends StatelessWidget {
  const FirstSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FirstSignupForm());
  }
}
