import 'package:book_it/features/Introduction/presentation/widgets/get_started_button.dart';
import 'package:book_it/features/Introduction/presentation/widgets/welcome_text_column.dart';
import 'package:book_it/features/Introduction/presentation/widgets/welcome_page_image.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [WelcomePageImage(), WelcomeTextColumn(), GetStartedButton()],
      ),
    );
  }
}
