import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_it/features/Favourites/data/repo/favourites_repo.dart';
import 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final FavouritesRepo repo;

  FavouritesCubit(this.repo) : super(FavouritesInitial());

  Future<void> fetchFavourites() async {
    emit(FavouritesLoading());

    final (list, status) = await repo.getFavourites();
    if (status != FavouritesStatus.success) {
      emit(FavouritesErrorState());
      return;
    }

    emit(
      FavouritesLoaded(
        favourites: list,
        favouriteIds: list.map((p) => p.id).toSet(),
      ),
    );
  }

  Future<void> toggleFavourite(PropertyModel property) async {
    if (state is! FavouritesLoaded) return;

    final currentState = state as FavouritesLoaded;
    final updatedFavourites = List<PropertyModel>.from(currentState.favourites);
    final updatedIds = Set<int>.from(currentState.favouriteIds);

    if (updatedIds.contains(property.id)) {
      updatedIds.remove(property.id);
      updatedFavourites.removeWhere((p) => p.id == property.id);
    } else {
      updatedIds.add(property.id);
      updatedFavourites.add(property);
    }

    emit(
      FavouritesLoaded(favourites: updatedFavourites, favouriteIds: updatedIds),
    );

    final (_, status) = await repo.toggleFavourite(property.id);

    if (status != FavouritesStatus.success) {
      emit(currentState);
    }
  }

  bool isFavourite(int propertyId) {
    if (state is! FavouritesLoaded) return false;
    return (state as FavouritesLoaded).favouriteIds.contains(propertyId);
  }
}
