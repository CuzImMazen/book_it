import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Owner/data/models/pending_booking.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_state.dart';
import 'package:book_it/features/Owner/presentation/widgets/accept_button.dart';
import 'package:book_it/features/Owner/presentation/widgets/reject_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModificationRequestCard extends StatelessWidget {
  final PendingBookingModel pendingBooking;

  const ModificationRequestCard({super.key, required this.pendingBooking});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Card(
        elevation: 15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                pendingBooking.property.mainImage,

                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      capitalize(pendingBooking.property.category),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const Icon(Icons.person_2),
                  const SizedBox(width: 7),
                  Text(
                    "${pendingBooking.user.firstName} ${pendingBooking.user.lastName}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "${pendingBooking.property.governorate}, ${pendingBooking.property.city}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Text(
                    "\$${pendingBooking.property.price}/Night",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Text(
                    "Original Date:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 18),
                  const Icon(Icons.calendar_month_outlined, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    formatBookingDates(
                      pendingBooking.startDate,
                      pendingBooking.endDate,
                    ),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Text(
                    "Adjusted Date:",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.black87,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    formatBookingDates(
                      pendingBooking.editStartDate ?? pendingBooking.startDate,
                      pendingBooking.editEndDate ?? pendingBooking.endDate,
                    ),
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<OwnerRequestsCubit, OwnerRequestsState>(
              builder: (context, state) {
                if (state is OwnerRequestsLoaded &&
                    state.loadingIds.contains(pendingBooking.id)) {
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => context
                          .read<OwnerRequestsCubit>()
                          .acceptModification(pendingBooking.id),
                      child: const AcceptButton(),
                    ),
                    const SizedBox(width: 25),
                    GestureDetector(
                      onTap: () => context
                          .read<OwnerRequestsCubit>()
                          .rejectModification(pendingBooking.id),
                      child: const RejectButton(),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
