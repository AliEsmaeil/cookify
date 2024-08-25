import 'package:dartz/dartz.dart';
import 'package:wagba/core/constants/firebase_constants.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

abstract class BaseFavoritesDataSource{
  final db = FireStoreConstants.db;

  Future<Either<Failure, bool>> addFavorite({required MealInCategory meal});
  Future<Either<Failure, bool>> removeFavorite({required String mealId});

  Future<Either<Failure, List<MealInCategory>>> getAllFavorites();
}