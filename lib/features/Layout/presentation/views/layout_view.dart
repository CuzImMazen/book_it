import 'package:book_it/features/Layout/presentation/ViewModel/cubit/navigation_bar_cubit.dart';
import 'package:book_it/features/Layout/presentation/widgets/layout_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBarCubit(),
      child: const LayoutViewPage(),
    );
  }
}
