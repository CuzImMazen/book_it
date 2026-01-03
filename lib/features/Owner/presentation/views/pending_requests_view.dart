import 'package:book_it/core/error/owner_requests_mapper.dart';
import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:book_it/core/widgets/primary_text.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_state.dart';
import 'package:book_it/features/Owner/presentation/views/bookings_requests_tab.dart';
import 'package:book_it/features/Owner/presentation/views/modification_requests_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_it/core/utils/helpers.dart';

class PendingRequestsView extends StatefulWidget {
  const PendingRequestsView({super.key});

  @override
  State<PendingRequestsView> createState() => _PendingRequestsViewState();
}

class _PendingRequestsViewState extends State<PendingRequestsView> {
  @override
  void initState() {
    context.read<OwnerRequestsCubit>().getAllRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OwnerRequestsCubit, OwnerRequestsState>(
      listener: (context, state) {
        if (state is OwnerRequestsLoaded && state.snackMessage != null) {
          final rawMessage = state.snackMessage!.split("|")[0];

          final message = mapOwnerRequestMessage(context, rawMessage);

          showSnackBar(
            context: context,
            message: message,
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
            title: PrimaryText(text: context.ownerloc.pendingRequests_title),
            bottom: TabBar(
              tabs: [
                Tab(text: context.ownerloc.pendingRequests_tab_bookings),
                Tab(text: context.ownerloc.pendingRequests_tab_modifications),
              ],
            ),
          ),
          body: const TabBarView(
            children: [BookingsRequestsTab(), ModificationRequestsTab()],
          ),
        ),
      ),
    );
  }
}
