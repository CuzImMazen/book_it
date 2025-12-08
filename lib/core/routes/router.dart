import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Authentication/data/models/first_signup_data.dart';
import 'package:book_it/features/Authentication/presentation/views/first_signup_view.dart';
import 'package:book_it/features/Authentication/presentation/views/second_signup_view.dart';
import 'package:book_it/features/Authentication/presentation/views/signin_view_.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Home/presentation/views/property_detail_view.dart';
import 'package:book_it/features/Introduction/presentation/views/welcome_view.dart';
import 'package:book_it/features/Layout/presentation/views/layout_view.dart';
import 'package:book_it/features/Splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
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
  ],
);
