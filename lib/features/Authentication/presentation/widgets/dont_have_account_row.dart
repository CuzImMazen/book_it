import 'package:book_it/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DontHaveAccountRow extends StatelessWidget {
  const DontHaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            context.push('/signup');
          },
          child: Text(
            "Create new account",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
