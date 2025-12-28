// ignore_for_file: unused_import

import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Authentication/data/models/first_signup_data.dart';
import 'package:book_it/features/Authentication/presentation/views/first_signup_view.dart';
import 'package:book_it/features/Authentication/presentation/views/second_signup_view.dart';
import 'package:book_it/features/Authentication/presentation/views/signin_view_.dart';
import 'package:book_it/features/Book/data/model/confirm_book_data.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Book/presentation/views/book_confirmation_view.dart';
import 'package:book_it/features/Home/presentation/views/filter_view.dart';
import 'package:book_it/features/Home/presentation/views/property_detail_view.dart';
import 'package:book_it/features/Introduction/presentation/views/welcome_view.dart';
import 'package:book_it/features/Layout/presentation/views/layout_view.dart';
import 'package:book_it/features/Owner/data/repo/owner_properties_repo.dart';
import 'package:book_it/features/Owner/data/repo/owner_requests_repo.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/create_property_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_properties_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_requests_cubit.dart';
import 'package:book_it/features/Owner/presentation/views/create_property_view.dart';
import 'package:book_it/features/Owner/presentation/views/create_property_view2.dart';
import 'package:book_it/features/Owner/presentation/widgets/create_property_view_body.dart';
import 'package:book_it/features/Owner/presentation/widgets/create_property_view2_body.dart';
import 'package:book_it/features/Owner/presentation/views/my_properties_view.dart';
import 'package:book_it/features/Owner/presentation/views/pending_requests_view.dart';
import 'package:book_it/features/Splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      // builder: (context, state) => const BookConfirmationView(
      //   confirmBookData: ConfirmBookData(propertyId: 1, price: "25"),
      // ),
      builder: (context, state) => const SplashView(),
      // builder: (context, state) => const LayoutView(),
      //builder: (context, state) => const MyPropertiesView(),
      //  builder: (context, state) => const CreatePropertyView(),
      // builder: (context, state) => const FilterView(),
    ),
    GoRoute(
      path: '/welcome',
      pageBuilder: (context, state) => fadeTransitionPage(const WelcomeView()),
    ),
    GoRoute(path: '/signin', builder: (context, state) => const SigninView()),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const FirstSignUpView(),
    ),
    GoRoute(
      path: '/signup2',
      builder: (context, state) {
        final FirstSignupData firstSignupData = state.extra as FirstSignupData;
        return SecondSignUpView(firstSignupData: firstSignupData);
      },
    ),
    GoRoute(path: "/main", builder: (context, state) => const LayoutView()),
    GoRoute(
      path: "/propertydetail",
      builder: (context, state) {
        final PropertyModel property = state.extra as PropertyModel;

        return PropertyDetailView(property: property);
      },
    ),
    GoRoute(path: "/filter", builder: (context, state) => const FilterView()),
    GoRoute(
      path: "/confirm_book",
      builder: (context, state) {
        final ConfirmBookData confirmBookData = state.extra as ConfirmBookData;
        return BookConfirmationView(confirmBookData: confirmBookData);
      },
    ),
    GoRoute(
      path: "/myproperties",
      builder: (context, state) => BlocProvider(
        create: (context) => OwnerPropertiesCubit()..getOwnerProperties(),
        child: const MyPropertiesView(),
      ),
    ),
    GoRoute(
      path: "/pendingrequests",
      builder: (context, state) => BlocProvider(
        create: (context) =>
            OwnerRequestsCubit(OwnerRequestsRepo())..getAllRequests(),
        child: const PendingRequestsView(),
      ),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(
          create: (_) => CreatePropertyCubit(OwnerPropertiesRepo()),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: "/createproperty",
          builder: (context, state) => const CreatePropertyView(),
        ),
        GoRoute(
          path: "/createproperty2",
          builder: (context, state) => const CreatePropertyView2(),
        ),
      ],
    ),
  ],
);
