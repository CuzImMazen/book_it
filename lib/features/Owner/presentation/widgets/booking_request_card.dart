import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:book_it/core/utils/category_localization.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/core/utils/location_localization.dart';
import 'package:book_it/features/Owner/data/models/pending_booking.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_cubit.dart';
import 'package:book_it/features/Owner/presentation/widgets/accept_button.dart';
import 'package:book_it/features/Owner/presentation/widgets/reject_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingRequestCard extends StatelessWidget {
  const BookingRequestCard({
    super.key,
    required this.pendingBooking,
    this.isLoading = false,
  });

  final PendingBookingModel pendingBooking;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(pendingBooking.property.mainImage),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        localizedCategory(
                          context,
                          pendingBooking.property.category,
                        ),
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
                        overflow: TextOverflow.ellipsis,
                        "${localizedGovernorate(context, pendingBooking.property.governorate)}, ${localizedCity(context, pendingBooking.property.governorate, pendingBooking.property.city)}",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const Icon(Icons.calendar_month_outlined),
                    const SizedBox(width: 5),
                    Text(
                      formatBookingDates(
                        context,
                        pendingBooking.startDate,
                        pendingBooking.endDate,
                      ),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "\$${pendingBooking.property.price}/${context.ownerloc.bookingRequest_perNight}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isLoading)
                    const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  else ...[
                    GestureDetector(
                      onTap: () => context
                          .read<OwnerRequestsCubit>()
                          .acceptBooking(pendingBooking.id),
                      child: const AcceptButton(),
                    ),
                    const SizedBox(width: 25),
                    GestureDetector(
                      onTap: () => context
                          .read<OwnerRequestsCubit>()
                          .rejectBooking(pendingBooking.id),
                      child: const RejectButton(),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
