import 'package:book_it/features/History/presentation/views/canceled_tab_view.dart';
import 'package:book_it/features/History/presentation/views/completed_tab_view.dart';
import 'package:book_it/features/History/presentation/views/on_going_tab_view.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

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
