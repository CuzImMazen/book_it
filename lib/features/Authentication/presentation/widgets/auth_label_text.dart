import 'package:flutter/material.dart';

class AuthLabelText extends StatelessWidget {
  const AuthLabelText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
