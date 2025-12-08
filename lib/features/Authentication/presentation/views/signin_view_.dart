import 'package:book_it/features/Authentication/presentation/widgets/signin_form.dart';
import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignInForm());
  }
}
