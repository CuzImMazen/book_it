import 'package:book_it/core/style/colors.dart';
import 'package:book_it/features/Authentication/presentation/ViewModel/cubit/authentication_cubit.dart';
import 'package:book_it/features/Favourites/presentation/views/favourites_view.dart';
import 'package:book_it/features/History/presentation/views/history_view.dart';
import 'package:book_it/features/Home/presentation/views/home_view.dart';
import 'package:book_it/features/Layout/presentation/ViewModel/cubit/navigation_bar_cubit.dart';
import 'package:book_it/features/Settings/presentation/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class LayoutViewPage extends StatelessWidget {
  const LayoutViewPage({super.key});
  List<Widget> get pages => const [
    HomeView(),
    FavouritesView(),
    HistoryView(),
    SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, int>(
      builder: (context, index) {
        bool isSigningOut =
            context.watch<AuthenticationCubit>().state is AuthenticationLoading;
        return Scaffold(
          body: IndexedStack(index: index, children: pages),

          bottomNavigationBar: IgnorePointer(
            ignoring: isSigningOut,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 22.0,
                right: 22,
                bottom: 22,
                top: 8,
              ),
              child: GNav(
                gap: 10,
                iconSize: 25,

                tabBackgroundColor: kPrimaryColor.withAlpha(125),
                padding: EdgeInsetsGeometry.only(
                  left: 15,
                  right: 15,
                  top: 10,
                  bottom: 10,
                ),
                selectedIndex: index,
                onTabChange: (index) {
                  context.read<NavigationBarCubit>().setNavigationBarIndex(
                    index,
                  );
                },
                tabs: [
                  GButton(icon: Icons.home, text: "Home"),
                  GButton(icon: Icons.favorite, text: "Favorites"),
                  GButton(icon: Icons.history, text: "History"),
                  GButton(icon: Icons.settings, text: "Settings"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
// NavigationBar(
//               backgroundColor: Colors.transparent,
//               onDestinationSelected: (value) => context
//                   .read<NavigationBarCubit>()
//                   .setNavigationBarIndex(value),
//               selectedIndex: index,
//               destinations: [
//                 NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
//                 NavigationDestination(
//                   icon: Icon(Icons.favorite),
//                   label: 'Favorites',
//                 ),
//                 NavigationDestination(
//                   icon: Icon(Icons.history),
//                   label: 'History',
//                 ),

//                 NavigationDestination(
//                   icon: Icon(Icons.settings),
//                   label: 'Settings',
//                 ),
//               ],
//             ),
