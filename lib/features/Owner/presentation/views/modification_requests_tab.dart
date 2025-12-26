import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_state.dart';
import 'package:book_it/features/Owner/presentation/widgets/modification_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModificationRequestsTab extends StatelessWidget {
  const ModificationRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerRequestsCubit, OwnerRequestsState>(
      listener: (context, state) {
        if (state is OwnerRequestsLoaded &&
            state.snackMessage != null &&
            state.snackSuccess != null) {
          showSnackBar(
            context: context,
            message: state.snackMessage!,
            color: state.snackSuccess! ? Colors.green : Colors.red,
          );
          context.read<OwnerRequestsCubit>().clearSnackBar();
        }
      },
      builder: (context, state) {
        if (state is OwnerRequestsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is OwnerRequestsFailure) {
          return Center(child: Text(state.error));
        }
        if (state is OwnerRequestsLoaded) {
          if (state.modifications.isEmpty) {
            return const Center(child: Text("No pending modifications"));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            itemCount: state.modifications.length,
            itemBuilder: (context, index) {
              final pending = state.modifications[index];
              return ModificationRequestCard(
                pendingBooking: pending,
                isLoading: state.loadingItemId == pending.id,
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
