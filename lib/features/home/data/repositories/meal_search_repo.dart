import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/data/data_sources/meal_search_data_source.dart';
import 'package:wagba/features/home/domain/entities/meal.dart';
import 'package:wagba/features/home/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/features/home/domain/repositories/base_meal_search_repo.dart';

final class MealSearchRepo extends BaseMealSearchRepo{

  final BaseMealSearchDataSource _dataSource;

  const MealSearchRepo({required BaseMealSearchDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<Either<Failure, Meal>> getRandomMeal()async{
    return await _dataSource.getRandomMeal();
  }

  @override
  Future<Either<Failure, Meal>> searchMealById({required int mealId})async{
    return await _dataSource.searchMealById(mealId: mealId);
  }

  @override
  Future<Either<Failure, List<Meal>>> searchMealByName({required String mealName})async{
    return await _dataSource.searchMealByName(mealName: mealName);
  }

  @override
  Future<Either<Failure, List<MealInCategory>>> searchMealContainingIngredient({required String ingredient})async{
    return await _dataSource.searchMealContainingIngredient(ingredient: ingredient);
  }

}