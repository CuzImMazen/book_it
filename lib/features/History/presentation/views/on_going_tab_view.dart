import 'package:book_it/core/error/history_error_mapper.dart';
import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:book_it/core/style/colors.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_cubit.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_state.dart';
import 'package:book_it/features/History/presentation/widgets/bookings_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnGoingTabView extends StatelessWidget {
  const OnGoingTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingHistoryCubit, BookingHistoryState>(
      builder: (context, state) {
        if (state.isLoadingOngoing) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        }

        if (state.errorOngoing != null) {
          return Center(child: Text(state.errorOngoing!.localized(context)));
        }
        if (state.ongoing.isEmpty) {
          return RefreshIndicator(
            color: kPrimaryColor,
            onRefresh: () async {
              await context.read<BookingHistoryCubit>().fetchOngoingBookings();
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(
                    child: Text(
                      context.history.history_no_ongoing_bookings,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: RefreshIndicator(
            color: kPrimaryColor,
            onRefresh: () async {
              await context.read<BookingHistoryCubit>().fetchOngoingBookings();
            },

            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final booking = state.ongoing[index];

                return BookingsContainer(book: booking);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemCount: state.ongoing.length,
            ),
          ),
        );
      },
    );
  }
}
