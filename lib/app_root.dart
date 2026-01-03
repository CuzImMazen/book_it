import 'package:book_it/core/routes/router.dart';
import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/themes/dark_theme.dart';
import 'package:book_it/features/Settings/presentation/viewModel/cubit/darkmode_cubit.dart';
import 'package:book_it/features/Settings/presentation/viewModel/cubit/language_cubit.dart';
import 'package:book_it/l10n/Authentication/auth_localizations.dart';
import 'package:book_it/l10n/Book/book_localizations.dart';
import 'package:book_it/l10n/History/history_localizations.dart';
import 'package:book_it/l10n/Home/home_localizations.dart';
import 'package:book_it/l10n/Layout/layout_localizations.dart';
import 'package:book_it/l10n/Owner/owner_localizations.dart';
import 'package:book_it/l10n/Settings/settings_localizations.dart';
import 'package:book_it/l10n/Welcome/welcome_localizations.dart';
import 'package:book_it/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<DarkmodedCubit>().state.themeMode;
    final locale = context.watch<LanguageCubit>().state.locale;

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      locale: locale,

      theme: ThemeData(
        fontFamily: 'Sora',
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: kPrimaryColor,
          selectionColor: kPrimaryColor,
          selectionHandleColor: kPrimaryColor,
        ),
      ),
      darkTheme: darkTheme,

      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        WelcomeLocalizations.delegate,
        AuthLocalizations.delegate,
        LayoutLocalizations.delegate,
        SettingsLocalizations.delegate,
        HomeLocalizations.delegate,
        BookLocalizations.delegate,
        HistoryLocalizations.delegate,
        OwnerLocalizations.delegate,

        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
