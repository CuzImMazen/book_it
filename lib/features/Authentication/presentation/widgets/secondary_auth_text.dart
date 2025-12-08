import 'package:flutter/material.dart';

class SecondaryAuthText extends StatelessWidget {
  const SecondaryAuthText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
