import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_cubit.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_state.dart';
import 'package:book_it/features/History/presentation/views/canceled_tab_view.dart';
import 'package:book_it/features/History/presentation/views/completed_tab_view.dart';
import 'package:book_it/features/History/presentation/views/on_going_tab_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingHistoryCubit, BookingHistoryState>(
      listener: (context, state) {
        if (state.cancelError != null) {
          showSnackBar(
            context: context,
            message: state.cancelError!,
            color: Colors.red,
            duration: const Duration(seconds: 2),
          );
        }
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            title: const Text(
              "Booking History",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(text: "Ongoing"),
                Tab(text: "Completed"),
                Tab(text: "Cancelled"),
              ],
            ),
          ),

          body: TabBarView(
            children: [
              const OnGoingTabView(),
              const CompletedTabView(),
              const CanceledTabView(),
              //const PendingTabView(),
            ],
          ),
        ),
      ),
    );
  }
}
