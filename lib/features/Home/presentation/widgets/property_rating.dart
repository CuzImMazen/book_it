import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Authentication/presentation/ViewModel/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyRatingWidget extends StatelessWidget {
  final double? averageRating;
  final int ratingsCount;
  final double? userRating;
  final int? ownerId;
  final int propertyId;

  const PropertyRatingWidget({
    super.key,
    required this.averageRating,
    required this.ratingsCount,
    required this.userRating,
    required this.ownerId,
    required this.propertyId,
  });

  @override
  Widget build(BuildContext context) {
    final double rating = averageRating ?? 0.0;

    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    final authState = context.watch<AuthenticationCubit>().state;
    final int currentUserId = authState is AuthenticationSignInSuccess
        ? authState.user.id
        : -1;
    return Row(
      children: [
        for (int i = 0; i < fullStars; i++)
          const Icon(Icons.star, color: Colors.amber, size: 20),
        if (hasHalfStar)
          const Icon(Icons.star_half, color: Colors.amber, size: 20),
        for (int i = 0; i < 5 - fullStars - (hasHalfStar ? 1 : 0); i++)
          const Icon(Icons.star_border, color: Colors.amber, size: 20),

        const SizedBox(width: 8),

        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(width: 4),

        Text('($ratingsCount)', style: const TextStyle(color: Colors.grey)),
        const Spacer(),
        if (ownerId != null)
          GestureDetector(
            onTap: () {
              if (ownerId == currentUserId) {
                showSnackBar(
                  context: context,
                  message: "You can't rate your own property",
                  color: Colors.red,
                );
                return;
              }
              final cubitContext = context;
              showRatingDialog(
                context: context,
                initialRating: userRating,
                propertyId: propertyId,
                parentContext: cubitContext,
              );
            },

            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber.withAlpha(20),
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                "Rate this property",
                style: const TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
