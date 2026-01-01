import 'package:book_it/core/style/colors.dart';
import 'package:book_it/features/History/data/model/book_model.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_cubit.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_state.dart';
import 'package:book_it/features/History/presentation/widgets/edit_active_booking_dialog_content.dart';
import 'package:book_it/features/History/presentation/widgets/edit_upcoming_booking_dialog_content.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/filter_cubit.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/property_cubit.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/property_rating_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Future<String?> pickBirthDate({required BuildContext context}) async {
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime(2000),
    firstDate: DateTime(1940),
    lastDate: DateTime(2020),
  );

  if (pickedDate != null) {
    return "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
  }
  return null;
}

Future<String?> pickStartDate({required BuildContext context}) async {
  final tomorrow = DateTime.now().add(const Duration(days: 1));
  final lastDate = tomorrow.add(const Duration(days: 365));
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: tomorrow,
    firstDate: tomorrow,
    lastDate: lastDate,
  );

  if (pickedDate != null) {
    return "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
  }
  return null;
}

Future<String?> pickEndDate({
  required BuildContext context,
  required String startDate,
}) async {
  if (startDate.isEmpty || startDate == "null") {
    showSnackBar(
      context: context,
      message: "Please enter your start date first",
      color: kPrimaryColor.withAlpha(200),
    );
    return null;
  }

  final dateFormat = DateFormat('yyyy-M-d');
  final DateTime start = dateFormat.parse(startDate);

  final minEndDate = start.add(const Duration(days: 1));
  final maxEndDate = start.add(const Duration(days: 365));

  final pickedDate = await showDatePicker(
    context: context,
    initialDate: minEndDate,
    firstDate: minEndDate,
    lastDate: maxEndDate,
  );

  if (pickedDate != null) {
    return "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
  }

  return null;
}

void showSnackBar({
  required BuildContext context,
  required String message,
  Color color = Colors.grey,
  Duration duration = const Duration(milliseconds: 800),
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: duration,
    ),
  );
}

CustomTransitionPage fadeTransitionPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 600),
  );
}

List<String> getCities(String? governorate) {
  switch (governorate) {
    case "All":
      return const [];
    case "Damascus":
      return const [
        "Al-Qadam",
        "Mazzeh",
        "Al-Salihiyah",
        "Baramkeh",
        "Al-Zahra",
      ];
    case "Rural Damascus":
      return const ["Douma", "Harasta", "Saidnaya", "Zabadani", "Al-Tall"];
    case "Aleppo":
      return const ["Azaz", "Al-Bab", "Manbij", "Jarabulus", "Al-Sukkari"];
    case "Idlib":
      return const ["Maarat al-Numan", "Jisr al-Shughur", "Ariha", "Saraqib"];
    case "Homs":
      return const ["Al-Rastan", "Al-Qusayr", "Talbiseh", "Tadmur"];
    case "Hama":
      return const ["Masyaf", "Salamiyah", "Mahardah", "Suran"];
    case "Latakia":
      return const ["Jableh", "Qardaha", "Al-Haffah", "Rabia"];
    case "Tartus":
      return const ["Baniyas", "Safita", "Al-Shaykh Badr", "Duraykish"];
    case "Sweidah":
      return const ["Shahba", "Sahwat al-Khudr", "Shaqqa", "Rweished"];
    case "Dara'a":
      return const ["Da'el", "Nawa", "Izraa", "Al-Shajara"];
    case "Hassakeh":
      return const ["Qamishli", "Amuda", "Al-Malikiyah", "Ras al-Ayn"];
    case "Deir Alzoor":
      return const ["Al-Mayadin", "Al-Busayrah", "Al-Shuhayl", "Al-Kasrah"];
    case "Alraqqa":
      return const ["Al-Thawrah", "Al-Mansurah", "Al-Resafa", "Al-Hurriya"];
    case "AlQuneitra":
      return const ["Fiq", "Buqata", "Kafr Shams"];
    default:
      return const [];
  }
}

List<String> getGovernorates() {
  return const [
    "All",
    "Damascus",
    "Rural Damascus",
    "Aleppo",
    "Idlib",
    "Homs",
    "Hama",
    "Latakia",
    "Tartus",
    "Sweidah",
    "Dara'a",
    "Hassakeh",
    "Deir Alzoor",
    "Alraqqa",
    "AlQuneitra",
  ];
}

// Future<dynamic> showDiscardFiltersDialog(BuildContext context) {
//   return showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       actionsAlignment: MainAxisAlignment.center,
//       title: const Text("Are you sure?"),
//       content: const Text(
//         "You will lose all your filters",
//         style: TextStyle(fontSize: 16),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             context.pop();
//           },
//           child: const Text(
//             "Cancel",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//         ),
//         SizedBox(width: 10),
//         TextButton(
//           onPressed: () {
//             context.read<FilterCubit>().clearFilters();
//             context.read<PropertyCubit>().getProperties(const {});
//             context.pop();
//             context.pop();
//           },
//           child: const Text(
//             "Yes",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.red,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
Future<dynamic> showDiscardFiltersDialog(BuildContext parentContext) {
  return showDialog(
    context: parentContext,
    builder: (_) => AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: const Text("Are you sure?"),
      content: const Text(
        "You will lose all your filters",
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () {
            parentContext.pop();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            parentContext.read<FilterCubit>().clearFilters();
            parentContext.read<PropertyCubit>().getProperties(const {});
            parentContext.pop(); // close dialog
            parentContext.pop(); // go back
          },
          child: const Text(
            "Yes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}

String formatBookingDates(String start, String end) {
  String padDate(String date) {
    final parts = date.split('-');
    final year = parts[0];
    final month = parts[1].padLeft(2, '0');
    final day = parts[2].padLeft(2, '0');
    return "$year-$month-$day";
  }

  final startDate = DateTime.parse(padDate(start));
  final endDate = DateTime.parse(padDate(end));

  final startFormatted = DateFormat.MMMd().format(startDate);
  final endFormatted = DateFormat.MMMd().format(endDate);

  return "$startFormatted - $endFormatted";
}

String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

Future<dynamic> showBookingSuccessDialog(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        "Success",
        style: TextStyle(
          color: Colors.green,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        " your Booking request has been sent Successfully",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () => context.go("/main"),
            child: Text(
              "OK",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}

Future<void> showDeletePropertyDialog({
  required BuildContext context,
  required VoidCallback onDelete,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          "Are you sure?",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Are you sure you want to delete this property?",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 15),
              TextButton(
                onPressed: () {
                  context.pop(); // close dialog first
                  onDelete();
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

Future<dynamic> showCantAccessOwnerFeatureDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          "You cant access this Feature",
          style: TextStyle(
            fontSize: 24,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          "please create an owner account and try again.",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Center(
              child: const Text(
                "OK",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Future<dynamic> showCancelBookingDialog(BuildContext context, BookModel book) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Cancel booking"),
        content: const Text(
          "Are you sure you want to cancel this booking?",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "No",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  context.read<BookingHistoryCubit>().cancelBooking(book);
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel Booking",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

Future<dynamic> showEditUpcomingBookingDialog(
  BuildContext context,
  BookModel book,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          "Edit Booking",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        content: BlocListener<BookingHistoryCubit, BookingHistoryState>(
          listener: (context, state) {
            if (!state.editingIds.contains(book.id)) {
              if (state.editError != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.editError!),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              final isEdited = state.ongoing.any(
                (b) => b.id == book.id && b.status == 'PendingEdit',
              );

              if (isEdited) {
                showSnackBar(
                  context: context,
                  message: "Update Booking request has been sent to Owner",
                  color: Colors.green,
                );

                context.pop();
              }
            }
          },
          child: EditUpCommingBookingDialogContent(book: book),
        ),
      );
    },
  );
}

Future<dynamic> showEditActiveBookingDialog(
  BuildContext context,
  BookModel book,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          "Edit Booking",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        content: BlocListener<BookingHistoryCubit, BookingHistoryState>(
          listener: (context, state) {
            if (!state.editingIds.contains(book.id)) {
              if (state.editError != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.editError!),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                showSnackBar(
                  context: context,
                  message: "Booking update request has been sent to Owner",
                  color: Colors.green,
                );
                Navigator.of(context).pop();
              }
            }
          },
          child: EditActiveBookingDialogContent(book: book),
        ),
      );
    },
  );
}

Future<void> showLanguageDialog(
  BuildContext context, {
  required String currentLang,
  required Function(String) onSelect,
}) async {
  String selectedLang = currentLang;

  await showDialog(
    context: context,
    builder: (_) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: const Text("Choose Language"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("English"),
              trailing: selectedLang == 'en'
                  ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                  : null,
              onTap: () {
                selectedLang = 'en';
                setState(() {});
                onSelect('en');
                context.pop();
              },
            ),
            ListTile(
              title: const Text("العربية"),
              trailing: selectedLang == 'ar'
                  ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                  : null,
              onTap: () {
                selectedLang = 'ar';
                setState(() {});
                onSelect('ar');
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    ),
  );
}

Future<void> showLogoutDialog(
  BuildContext context, {
  required VoidCallback onConfirm,
}) async {
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      backgroundColor: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.logout, size: 50, color: kPrimaryColor.withAlpha(125)),
            const SizedBox(height: 16),
            const Text(
              "Logout",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "Are you sure you want to logout?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel", style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor.withAlpha(125),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () {
                    onConfirm();
                    context.pop();
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Future<void> showRatingDialog({
  required BuildContext context,
  required BuildContext parentContext,
  required double? initialRating,
  required int propertyId,
}) async {
  double rating = initialRating ?? 0.0;
  bool hasRated = initialRating != null && initialRating > 0;

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return StatefulBuilder(
        builder: (context, setState) {
          return BlocConsumer<PropertyRatingCubit, PropertyRatingState>(
            bloc: parentContext.read<PropertyRatingCubit>(),
            listener: (context, state) {
              if (state is PropertyRatingSuccess) {
                context.read<PropertyCubit>().getProperties(
                  context.read<FilterCubit>().state.toQueryParameters(),
                );
                context.pop();
                showSnackBar(
                  context: parentContext,
                  message: "Rating submitted successfully!",
                  color: Colors.green,
                );
              } else if (state is PropertyRatingFailure) {
                context.pop();
                showSnackBar(
                  context: parentContext,
                  message: state.message,
                  color: Colors.red,
                );
              }
            },
            builder: (context, state) {
              final isLoading = state is PropertyRatingLoading;
              final theme = Theme.of(context);

              final isDark = theme.brightness == Brightness.dark;

              return Dialog(
                backgroundColor: isDark ? Colors.grey[900] : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        hasRated ? 'Update Your Rating' : 'Rate This Property',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        hasRated
                            ? 'You previously rated this property $initialRating ⭐\nYou can update your rating below.'
                            : 'How would you rate your experience?',
                        style: TextStyle(
                          fontSize: 14,
                          color: isDark ? Colors.white70 : Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      RatingBar.builder(
                        initialRating: rating,
                        minRating: 1,
                        maxRating: 5,

                        itemCount: 5,
                        itemSize: 40,
                        glow: false,
                        itemPadding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                        ),
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (value) =>
                            setState(() => rating = value),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Cancel Button
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: isDark
                                  ? Colors.grey[800]
                                  : Colors.grey[200],
                              foregroundColor: isDark
                                  ? Colors.white
                                  : Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                            onPressed: isLoading
                                ? null
                                : () => Navigator.of(context).pop(),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),

                          // Submit/Update Button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: rating < 1
                                  ? Colors.grey
                                  : Colors.amber,
                              foregroundColor: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                            onPressed: isLoading || rating < 1
                                ? null
                                : () {
                                    parentContext
                                        .read<PropertyRatingCubit>()
                                        .rateProperty(propertyId, rating);
                                  },
                            child: isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    hasRated ? 'Update' : 'Submit',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}
