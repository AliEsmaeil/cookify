import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/favorites/data/data_sources/base_fav_data_source.dart';
import 'package:wagba/features/favorites/domain/repositories/base_fav_repo.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

class FavoritesRepo extends BaseFavoritesRepo{

  final BaseFavoritesDataSource _dataSource;


  FavoritesRepo({required BaseFavoritesDataSource dataSource}): _dataSource = dataSource;

  @override
  Future<Either<Failure, bool>> addFavorite({required MealInCategory meal}) async{

    return await _dataSource.addFavorite(meal: meal);
  }

  @override
  Future<Either<Failure, List<MealInCategory>>> getAllFavorites() async{
    return await _dataSource.getAllFavorites();
  }

  @override
  Future<Either<Failure, bool>> removeFavorite({required String mealId}) async{
    return await _dataSource.removeFavorite(mealId: mealId);
  }

}