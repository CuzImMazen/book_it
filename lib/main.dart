import 'package:book_it/core/style/colors.dart';
import 'package:book_it/features/Authentication/data/repo/authentication_repo.dart';
import 'package:book_it/features/Authentication/presentation/ViewModel/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:book_it/core/routes/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AuthenticationCubit(AuthenticationRepo()),
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
