import 'package:book_it/core/style/colors.dart';
import 'package:book_it/features/Authentication/data/repo/authentication_repo.dart';
import 'package:book_it/features/Authentication/presentation/ViewModel/cubit/authentication_cubit.dart';
import 'package:book_it/features/History/data/repo/booking_history_repo.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_cubit.dart';
import 'package:book_it/features/Home/data/repo/property_repo.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/filter_cubit.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/property_cubit.dart';
import 'package:book_it/features/Settings/presentation/viewModel/cubit/language_cubit.dart';

import 'package:book_it/core/themes/dark_theme.dart';
// show darkTheme;

import 'package:flutter/material.dart';
import 'package:book_it/core/routes/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'features/Settings/presentation/viewModel/cubit/darkmode_cubit.dart';
//  show DarkmodedCubit;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await getApplicationDocumentsDirectory();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(directory.path),
  );
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

        BlocProvider(create: (context) => DarkmodedCubit()),
        BlocProvider(create: (context) => LanguageCubit()),
      ],

      child: Builder(
        builder: (context) {
          final themeMode = context.watch<DarkmodedCubit>().state.themeMode;
          final locale = context.watch<LanguageCubit>().state.locale;

          return MaterialApp.router(
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
            darkTheme: darkTheme,
            themeMode: themeMode,
            locale: locale,
            supportedLocales: AppLocalizations.supportedLocales,

            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    ),
  );
}
