import 'package:book_it/core/style/colors.dart';
import 'package:book_it/features/Authentication/data/repo/authentication_repo.dart';
import 'package:book_it/features/Authentication/presentation/ViewModel/cubit/authentication_cubit.dart';
import 'package:book_it/features/History/data/repo/booking_history_repo.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_cubit.dart';
import 'package:book_it/features/Home/data/repo/property_repo.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/filter_cubit.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/property_cubit.dart';
import 'package:flutter/material.dart';
import 'package:book_it/core/routes/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationCubit(AuthenticationRepo()),
        ),
        BlocProvider(create: (context) => FilterCubit()),
        BlocProvider(create: (context) => PropertyCubit(PropertyRepo())),
        BlocProvider(
          create: (context) => BookingHistoryCubit(BookingHistoryRepo()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          datePickerTheme: DatePickerThemeData().copyWith(),
          fontFamily: "Sora",
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: kPrimaryColor,
            selectionColor: kPrimaryColor,
            selectionHandleColor: kPrimaryColor,
          ),
        ),
      ),
    ),
  );
}
