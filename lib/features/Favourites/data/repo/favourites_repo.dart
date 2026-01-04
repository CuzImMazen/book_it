import 'package:book_it/features/Favourites/data/services/favourites_service.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:dio/dio.dart';

enum FavouritesStatus { success, networkError, serverError, unknownError }

class FavouritesRepo {
  final FavouritesService service = FavouritesService.instance;

  Future<(List<PropertyModel>, FavouritesStatus)> getFavourites() async {
    try {
      final response = await service.getFavourites();
      final List data = response.data?['data'] ?? [];
      final list = data.map((json) => PropertyModel.fromJson(json)).toList();
      return (list, FavouritesStatus.success);
    } on DioException catch (e) {
      return (
        <PropertyModel>[],
        e.response?.statusCode == null
            ? FavouritesStatus.networkError
            : FavouritesStatus.serverError,
      );
    } catch (_) {
      return (<PropertyModel>[], FavouritesStatus.unknownError);
    }
  }

  Future<(bool, FavouritesStatus)> toggleFavourite(int id) async {
    try {
      final response = await service.toggleFavourite(id);
      final isFav = (response.data?['is_favorite'] as bool?) ?? false;
      return (isFav, FavouritesStatus.success);
    } on DioException catch (e) {
      return (
        false,
        e.response?.statusCode == null
            ? FavouritesStatus.networkError
            : FavouritesStatus.serverError,
      );
    } catch (_) {
      return (false, FavouritesStatus.unknownError);
    }
  }
}
