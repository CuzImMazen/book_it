import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Owner/data/models/pending_booking.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_cubit.dart';
import 'package:book_it/features/Owner/presentation/widgets/accept_button.dart';
import 'package:book_it/features/Owner/presentation/widgets/reject_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingRequestCard extends StatelessWidget {
  const BookingRequestCard({super.key, required this.pendingBooking});
  final PendingBookingModel pendingBooking;
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        capitalize(pendingBooking.property.category),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    Icon(Icons.person_2),
                    SizedBox(width: 7),
                    Text(
                      "${pendingBooking.user.firstName} ${pendingBooking.user.lastName}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        "${pendingBooking.property.governorate},${pendingBooking.property.city}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),

                    Icon(Icons.calendar_month_outlined),
                    SizedBox(width: 5),
                    Text(
                      formatBookingDates(
                        pendingBooking.startDate,
                        pendingBooking.endDate,
                      ),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "\$${pendingBooking.property.price}/Night",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<OwnerRequestsCubit>().acceptBookingRequest(
                        pendingBooking.id,
                      );
                    },
                    child: AcceptButton(),
                  ),
                  SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      context.read<OwnerRequestsCubit>().rejectBookingRequest(
                        pendingBooking.id,
                      );
                    },
                    child: RejectButton(),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
