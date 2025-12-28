import 'package:book_it/features/Owner/presentation/widgets/create_property_view2_body.dart';
import 'package:flutter/material.dart';

class CreatePropertyView2 extends StatelessWidget {
  const CreatePropertyView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0.5,
        title: const Text(
          "Create Property",
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
      body: CreatePropertyView2Body(),
    );
  }
}
