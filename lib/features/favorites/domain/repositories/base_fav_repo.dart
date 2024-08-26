import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

abstract class BaseFavoritesRepo{

  Future<Either<Failure, bool>> addFavorite({required MealInCategory meal});
  Future<Either<Failure, bool>> removeFavorite({required String mealId});

  Future<Either<Failure, List<MealInCategory>>> getAllFavorites();

}