import 'package:book_it/app_root.dart';
import 'package:book_it/features/Authentication/data/repo/authentication_repo.dart';
import 'package:book_it/features/Authentication/presentation/ViewModel/cubit/authentication_cubit.dart';
import 'package:book_it/features/History/data/repo/booking_history_repo.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_cubit.dart';
import 'package:book_it/features/Home/data/repo/property_repo.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/filter_cubit.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/property_cubit.dart';
import 'package:book_it/features/Settings/presentation/viewModel/cubit/darkmode_cubit.dart';
import 'package:book_it/features/Settings/presentation/viewModel/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(directory.path),
  );

  runApp(const Bookit());
}

class Bookit extends StatelessWidget {
  const Bookit({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // =====================
        // Authentication
        // =====================
        BlocProvider(create: (_) => AuthenticationCubit(AuthenticationRepo())),

        // =====================
        // Home
        // =====================
        BlocProvider(create: (_) => FilterCubit()),
        BlocProvider(create: (_) => PropertyCubit(PropertyRepo())),

        // =====================
        // History
        // =====================
        BlocProvider(create: (_) => BookingHistoryCubit(BookingHistoryRepo())),

        // =====================
        // Settings
        // =====================
        BlocProvider(create: (_) => DarkmodedCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: const AppRoot(),
    );
  }
}
