// ignore_for_file: unused_import

import 'package:book_it/features/Book/data/repo/book_repo.dart';
import 'package:book_it/features/Book/presentation/ViewModel/cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// CORE
import 'package:book_it/core/utils/helpers.dart';

// AUTH
import 'package:book_it/features/Authentication/data/models/first_signup_data.dart';
import 'package:book_it/features/Authentication/presentation/views/first_signup_view.dart';
import 'package:book_it/features/Authentication/presentation/views/second_signup_view.dart';
import 'package:book_it/features/Authentication/presentation/views/signin_view_.dart';

// INTRO / SPLASH
import 'package:book_it/features/Splash/presentation/views/splash_view.dart';
import 'package:book_it/features/Introduction/presentation/views/welcome_view.dart';

// LAYOUT
import 'package:book_it/features/Layout/presentation/views/layout_view.dart';

// HOME
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Home/presentation/views/property_detail_view.dart';
import 'package:book_it/features/Home/presentation/views/filter_view.dart';

// BOOK
import 'package:book_it/features/Book/data/model/confirm_book_data.dart';
import 'package:book_it/features/Book/presentation/views/book_confirmation_view.dart';

// OWNER
import 'package:book_it/features/Owner/data/repo/owner_properties_repo.dart';
import 'package:book_it/features/Owner/data/repo/owner_requests_repo.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/create_property_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_properties_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_cubit.dart';
import 'package:book_it/features/Owner/presentation/views/my_properties_view.dart';
import 'package:book_it/features/Owner/presentation/views/create_property_view.dart';
import 'package:book_it/features/Owner/presentation/views/create_property_view2.dart';
import 'package:book_it/features/Owner/presentation/views/pending_requests_view.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    /// SPLASH
    GoRoute(path: '/', builder: (_, __) => const SplashView()),

    /// INTRO / AUTH
    GoRoute(
      path: '/welcome',
      pageBuilder: (_, __) => fadeTransitionPage(const WelcomeView()),
    ),
    GoRoute(path: '/signin', builder: (_, __) => const SigninView()),
    GoRoute(path: '/signup', builder: (_, __) => const FirstSignUpView()),
    GoRoute(
      path: '/signup2',
      builder: (_, state) {
        final data = state.extra as FirstSignupData;
        return SecondSignUpView(firstSignupData: data);
      },
    ),

    /// MAIN LAYOUT
    GoRoute(
      path: '/main',
      builder: (_, __) => const LayoutView(),
      routes: [
        /// HOME
        GoRoute(
          path: 'propertydetail',
          builder: (_, state) {
            final property = state.extra as PropertyModel;
            return PropertyDetailView(property: property);
          },
        ),
        GoRoute(path: 'filter', builder: (_, __) => const FilterView()),
        GoRoute(
          path: 'confirm_book',
          builder: (_, state) {
            final data = state.extra as ConfirmBookData;
            return BlocProvider(
              create: (context) => BookCubit(BookRepo()),
              child: BookConfirmationView(confirmBookData: data),
            );
          },
        ),

        /// OWNER SHELL (SHARED CUBITS)
        ShellRoute(
          builder: (context, state, child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => OwnerPropertiesCubit()..getOwnerProperties(),
                ),
                BlocProvider(
                  create: (_) => CreatePropertyCubit(OwnerPropertiesRepo()),
                ),
              ],
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: 'myproperties',
              builder: (_, __) => const MyPropertiesView(),
            ),
            GoRoute(
              path: 'myproperties/createproperty',
              builder: (_, __) => const CreatePropertyView(),
            ),
            GoRoute(
              path: 'myproperties/createproperty2',
              builder: (_, __) => const CreatePropertyView2(),
            ),
          ],
        ),

        /// OWNER REQUESTS (ISOLATED)
        GoRoute(
          path: 'pendingrequests',
          builder: (_, __) => BlocProvider(
            create: (_) =>
                OwnerRequestsCubit(OwnerRequestsRepo())..getAllRequests(),
            child: const PendingRequestsView(),
          ),
        ),
      ],
    ),
  ],
);
