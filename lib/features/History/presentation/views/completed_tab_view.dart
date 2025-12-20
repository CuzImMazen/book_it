import 'package:book_it/core/style/colors.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_cubit.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_state.dart';
import 'package:book_it/features/History/presentation/widgets/bookings_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedTabView extends StatelessWidget {
  const CompletedTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingHistoryCubit, BookingHistoryState>(
      builder: (context, state) {
        if (state.isLoadingCompleted) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        }

        if (state.errorCompleted != null) {
          return Center(child: Text(state.errorCompleted!));
        }
        if (state.completed.isEmpty) {
          return const Center(child: Text("No Completed bookings"));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final booking = state.completed[index];

              return BookingsContainer(book: booking);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: state.completed.length,
          ),
        );
      },
    );
  }
}
