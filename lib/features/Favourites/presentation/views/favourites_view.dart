import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:book_it/features/Favourites/presentation/viewModel/cubit/favourites_cubit.dart';
import 'package:book_it/features/Favourites/presentation/viewModel/cubit/favourites_state.dart';
import 'package:book_it/features/Home/presentation/widgets/property_container.dart';
import 'package:go_router/go_router.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          context.home.favourites,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: BlocBuilder<FavouritesCubit, FavouritesState>(
        builder: (context, state) {
          if (state is FavouritesLoading || state is FavouritesInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FavouritesErrorState) {
            return Center(child: Text(context.home.something_went_wrong));
          }

          final favourites = (state as FavouritesLoaded).favourites;

          if (favourites.isEmpty) {
            return Center(
              child: Text(
                context.home.no_favorites_yet,
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.push(
                      '/main/propertydetail',
                      extra: state.favourites[index],
                    );
                  },
                  child: PropertyContainer(
                    property: favourites[index],
                    forOwner: false,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
