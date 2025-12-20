import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_cubit.dart';
import 'package:book_it/features/History/presentation/views/canceled_tab_view.dart';
import 'package:book_it/features/History/presentation/views/completed_tab_view.dart';
import 'package:book_it/features/History/presentation/views/on_going_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  void initState() {
    super.initState();

    final historyCubit = context.read<BookingHistoryCubit>();

    historyCubit.reset();

    historyCubit.fetchOngoingBookings();
    historyCubit.fetchPastBookings();
    historyCubit.fetchCanceledBookings();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
          ],
        ),
      ),
    );
  }
}
