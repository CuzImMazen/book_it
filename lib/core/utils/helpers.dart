import 'package:book_it/features/Home/presentation/viewModel/cubit/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

List<String> getCities(String? governorate) {
  switch (governorate) {
    case "All":
      return const [];
    case "Damascus":
      return const [
        "Al-Qadam",
        "Mezzeh",
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
    case "Dar'a":
      return const ["Da'el", "Nawa", "Izraa", "Al-Shajara"];
    case "Hassakeh":
      return const ["Qamishli", "Amuda", "Al-Malikiyah", "Ras al-Ayn"];
    case "Deir Alzoor":
      return const ["Al-Mayadin", "Al-Busayrah", "Al-Shuhayl", "Al-Kasrah"];
    case "Alraqqa":
      return const ["Al-Thawrah", "Al-Mansurah", "Al-Resafa", "Al-Hurriya"];
    case "AlQuneitra":
      return const ["Fiq", "Buqata", "Kafr Shams", "Jubata al-Khashab"];
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
    "Dar'a",
    "Hassakeh",
    "Deir Alzoor",
    "Alraqqa",
    "AlQuneitra",
  ];
}

Future<dynamic> showDiscardFiltersDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: const Text("Are you sure?"),
      content: const Text(
        "You will lose all your filters",
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        SizedBox(width: 10),
        TextButton(
          onPressed: () {
            context.read<FilterCubit>().clearFilters();
            context.pop();
            context.pop();
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
