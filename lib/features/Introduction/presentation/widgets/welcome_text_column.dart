import 'package:book_it/core/extensions/localization_extension.dart';
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
          WelcomePrimaryText(text: context.welcome.welcomePrimary1),
          WelcomePrimaryText(text: context.welcome.welcomePrimary2),
          SizedBox(height: 7),
          WelcomeSecondaryText(text: context.welcome.welcomeSecondary1),
          WelcomeSecondaryText(text: context.welcome.welcomeSecondary2),
        ],
      ),
    );
  }
}
