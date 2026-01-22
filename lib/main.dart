import 'package:book_it/app_root.dart';
import 'package:book_it/core/notifications/notification_service.dart';
import 'package:book_it/features/Authentication/data/repo/authentication_repo.dart';
import 'package:book_it/features/Authentication/presentation/ViewModel/cubit/authentication_cubit.dart';
import 'package:book_it/features/Favourites/data/repo/favourites_repo.dart';
import 'package:book_it/features/Favourites/presentation/viewModel/cubit/favourites_cubit.dart';
import 'package:book_it/features/History/data/repo/booking_history_repo.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_cubit.dart';
import 'package:book_it/features/Home/data/repo/property_repo.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/filter_cubit.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/property_cubit.dart';
import 'package:book_it/features/Settings/presentation/viewModel/cubit/darkmode_cubit.dart';
import 'package:book_it/features/Settings/presentation/viewModel/cubit/language_cubit.dart';
import 'package:book_it/firebase_messaging_handler.dart';
import 'package:book_it/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await NotificationService.init();

  final directory = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(directory.path),
  );
  await dotenv.load(fileName: ".env");
  runApp(const Bookit());
}

class Bookit extends StatelessWidget {
  const Bookit({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthenticationCubit(AuthenticationRepo())),

        BlocProvider(create: (_) => FilterCubit()),
        BlocProvider(create: (_) => PropertyCubit(PropertyRepo())),
        BlocProvider(create: (_) => FavouritesCubit(FavouritesRepo())),

        BlocProvider(create: (_) => BookingHistoryCubit(BookingHistoryRepo())),

        BlocProvider(create: (_) => DarkmodedCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: const AppRoot(),
    );
  }
}
