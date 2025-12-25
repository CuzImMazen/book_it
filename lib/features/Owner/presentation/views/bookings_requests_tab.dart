import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_state.dart';
import 'package:book_it/features/Owner/presentation/widgets/booking_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingsRequestsTab extends StatelessWidget {
  const BookingsRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerRequestsCubit, OwnerRequestsState>(
      listener: (context, state) {
        if (state is AcceptSuccess) {
          showSnackBar(
            context: context,
            message: "Booking request accepted",
            color: Colors.green,
          );
        }
        if (state is RejectSuccess) {
          showSnackBar(
            context: context,
            message: "Booking request rejected",
            color: Colors.red,
          );
        }
        if (state is ActionFailure) {
          showSnackBar(
            context: context,
            message: state.message,
            color: Colors.red,
          );
        }
      },
      builder: (context, state) {
        if (state is OwnerRequestsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        }
        if (state is FetchRequestsFailure) {
          return Center(child: Text(state.message));
        }
        if (state is OwnerRequestsLoaded) {
          if (state.bookings.isEmpty) {
            return const Center(child: Text("No pending booking requests"));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ListView.builder(
              itemCount: state.bookings.length,
              itemBuilder: (context, index) {
                return BookingRequestCard(
                  pendingBooking: state.bookings[index],
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
