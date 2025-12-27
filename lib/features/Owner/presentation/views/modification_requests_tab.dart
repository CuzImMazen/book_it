import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_state.dart';
import 'package:book_it/features/Owner/presentation/widgets/modification_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModificationRequestsTab extends StatelessWidget {
  const ModificationRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnerRequestsCubit, OwnerRequestsState>(
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
              final booking = state.modifications[index];
              return ModificationRequestCard(
                pendingBooking: booking,
                isLoading: state.loadingModificationId == booking.id,
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
