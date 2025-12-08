import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<String?> pickDate({required BuildContext context}) async {
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
