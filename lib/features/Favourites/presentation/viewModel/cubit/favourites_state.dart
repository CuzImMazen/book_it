import 'package:book_it/features/Home/data/models/property_model.dart';

abstract class FavouritesState {}

class FavouritesInitial extends FavouritesState {}

class FavouritesLoading extends FavouritesState {}

class FavouritesLoaded extends FavouritesState {
  final List<PropertyModel> favourites;
  final Set<int> favouriteIds;

  FavouritesLoaded({required this.favourites, required this.favouriteIds});
}

class FavouritesErrorState extends FavouritesState {}
