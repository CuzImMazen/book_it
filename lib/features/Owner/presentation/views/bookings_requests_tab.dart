import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:book_it/core/style/colors.dart';
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
            return RefreshIndicator(
              color: kPrimaryColor,
              onRefresh: () async {
                await context.read<OwnerRequestsCubit>().getPendingBookings();
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: Text(
                        context.ownerloc.no_pending_bookings,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await context.read<OwnerRequestsCubit>().getPendingBookings();
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: state.bookings.length,
              itemBuilder: (context, index) {
                final booking = state.bookings[index];
                return BookingRequestCard(
                  pendingBooking: booking,
                  isLoading: state.loadingBookingId == booking.id,
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
