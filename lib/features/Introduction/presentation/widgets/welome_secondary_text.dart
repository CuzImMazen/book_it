import 'package:flutter/material.dart';

class WelcomeSecondaryText extends StatelessWidget {
  const WelcomeSecondaryText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.grey));
  }
}
