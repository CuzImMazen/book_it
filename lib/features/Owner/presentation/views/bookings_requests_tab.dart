import 'package:book_it/features/Owner/presentation/widgets/booking_request_card.dart';
import 'package:flutter/material.dart';

class BookingsRequestsTab extends StatelessWidget {
  const BookingsRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return BookingRequestCard();
        },
      ),
    );
  }
}
