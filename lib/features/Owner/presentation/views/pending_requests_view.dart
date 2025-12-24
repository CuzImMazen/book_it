import 'package:book_it/core/widgets/primary_text.dart';
import 'package:book_it/features/Owner/presentation/views/bookings_requests_tab.dart';
import 'package:book_it/features/Owner/presentation/views/modification_requests_tab.dart';
import 'package:flutter/material.dart';

class PendingRequestsView extends StatelessWidget {
  const PendingRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          actionsPadding: EdgeInsets.all(5),
          toolbarHeight: 80,
          centerTitle: true,
          title: PrimaryText(text: "Pending Requests"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Bookings"),
              Tab(text: "Modifications"),
            ],
          ),
        ),
        body: TabBarView(
          children: [BookingsRequestsTab(), ModificationRequestsTab()],
        ),
      ),
    );
  }
}
