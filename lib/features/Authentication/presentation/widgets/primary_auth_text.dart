import 'package:flutter/material.dart';

class PrimaryAuthText extends StatelessWidget {
  const PrimaryAuthText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
    );
  }
}
