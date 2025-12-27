import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_state.dart';
import 'package:book_it/features/Owner/presentation/widgets/booking_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingsRequestsTab extends StatelessWidget {
  const BookingsRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnerRequestsCubit, OwnerRequestsState>(
      builder: (context, state) {
        if (state is OwnerRequestsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is OwnerRequestsFailure) {
          return Center(child: Text(state.error));
        }

        if (state is OwnerRequestsLoaded) {
          if (state.bookings.isEmpty) {
            return const Center(child: Text("No pending bookings"));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            itemCount: state.bookings.length,
            itemBuilder: (context, index) {
              final booking = state.bookings[index];
              return BookingRequestCard(
                pendingBooking: booking,
                isLoading: state.loadingBookingId == booking.id,
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
