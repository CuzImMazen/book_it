import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_state.dart';
import 'package:book_it/features/Owner/presentation/widgets/modification_request_card.dart';

class ModificationRequestsTab extends StatelessWidget {
  const ModificationRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerRequestsCubit, OwnerRequestsState>(
      listener: (context, state) {
        if (state is OwnerRequestAction) {
          showSnackBar(
            context: context,
            message: state.message,
            color: state.success ? Colors.green : Colors.red,
          );
        }
      },
      builder: (context, state) {
        if (state is OwnerRequestsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        }

        if (state is OwnerRequestsFailure) {
          return Center(child: Text(state.message));
        }

        if (state is OwnerRequestsLoaded) {
          if (state.modifications.isEmpty) {
            return const Center(
              child: Text("No pending modification requests"),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  itemCount: state.modifications.length,
                  itemBuilder: (context, index) {
                    return ModificationRequestCard(
                      pendingBooking: state.modifications[index],
                    );
                  },
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
