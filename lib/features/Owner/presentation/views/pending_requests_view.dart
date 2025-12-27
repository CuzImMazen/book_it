import 'package:book_it/core/widgets/primary_text.dart';
import 'package:book_it/features/Owner/data/repo/owner_requests_repo.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_state.dart';
import 'package:book_it/features/Owner/presentation/views/bookings_requests_tab.dart';
import 'package:book_it/features/Owner/presentation/views/modification_requests_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_it/core/utils/helpers.dart';

class PendingRequestsView extends StatelessWidget {
  const PendingRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OwnerRequestsCubit(OwnerRequestsRepo())..getAllRequests(),
      child: BlocListener<OwnerRequestsCubit, OwnerRequestsState>(
        listener: (context, state) {
          if (state is OwnerRequestsLoaded && state.snackMessage != null) {
            // Only show the original message (ignore timestamp)
            final displayMessage = state.snackMessage!.split("|")[0];

            showSnackBar(
              context: context,
              message: displayMessage,
              color: state.snackSuccess == true ? Colors.green : Colors.red,
            );

            context.read<OwnerRequestsCubit>().clearSnackBar();
          }
        },
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              toolbarHeight: 80,
              title: const PrimaryText(text: "Pending Requests"),
              bottom: const TabBar(
                tabs: [
                  Tab(text: "Bookings"),
                  Tab(text: "Modifications"),
                ],
              ),
            ),
            body: const TabBarView(
              children: [BookingsRequestsTab(), ModificationRequestsTab()],
            ),
          ),
        ),
      ),
    );
  }
}
