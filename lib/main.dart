import 'package:book_it/app_root.dart';
import 'package:book_it/features/History/data/repo/booking_history_repo.dart';
import 'package:book_it/features/Home/data/repo/property_repo.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/filter_cubit.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/property_cubit.dart';
import 'package:book_it/features/Settings/presentation/viewModel/cubit/darkmode_cubit.dart';
import 'package:book_it/features/Settings/presentation/viewModel/cubit/language_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'features/History/presentation/ViewModel/cubit/booking_history_cubit.dart'
    show BookingHistoryCubit;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(directory.path),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FilterCubit()),
        BlocProvider(create: (_) => PropertyCubit(PropertyRepo())),
        BlocProvider(create: (_) => BookingHistoryCubit(BookingHistoryRepo())),
        BlocProvider(create: (_) => DarkmodedCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: const AppRoot(), // MaterialApp.router will go here
    );
  }
}
