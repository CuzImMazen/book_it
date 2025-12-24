import 'package:book_it/features/Owner/presentation/widgets/modification_request_card.dart';
import 'package:flutter/material.dart';

class ModificationRequestsTab extends StatelessWidget {
  const ModificationRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ModificationRequestCard();
        },
      ),
    );
  }
}
