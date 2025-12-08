import 'package:book_it/features/Introduction/presentation/widgets/welcome_primary_text.dart';
import 'package:book_it/features/Introduction/presentation/widgets/welome_secondary_text.dart';
import 'package:flutter/material.dart';

class WelcomeTextColumn extends StatelessWidget {
  const WelcomeTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.47),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          WelcomePrimaryText(text: "Find the Best Place"),
          WelcomePrimaryText(text: "For Rent In Good Price"),
          SizedBox(height: 7),
          WelcomeSecondaryText(
            text: "Find your perfect home with ease. Browse, ",
          ),
          WelcomeSecondaryText(
            text: "and book rental properties anytime, anywhere.",
          ),
        ],
      ),
    );
  }
}
