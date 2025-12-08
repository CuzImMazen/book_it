import 'package:flutter/material.dart';

class WelcomePageImage extends StatelessWidget {
  const WelcomePageImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset('assets/images/welcome.jpg', fit: BoxFit.cover),
    );
  }
}
