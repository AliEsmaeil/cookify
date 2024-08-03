import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/data/data_sources/meal_search_data_source.dart';
import 'package:wagba/features/home/domain/entities/meal.dart';
import 'package:wagba/features/home/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/features/home/domain/repositories/base_meal_search_repo.dart';

final class MealSearchUseCases{

  final BaseMealSearchRepo _repo;

  const MealSearchUseCases({required BaseMealSearchRepo repo}): _repo = repo;

  Future<Either<Failure, List<Meal>>> searchMealByName({required String mealName})async{
    return await _repo.searchMealByName(mealName: mealName);
  }

  Future<Either<Failure, List<MealInCategory>>> searchMealContainingIngredient({required String ingredient})async{
    return await _repo.searchMealContainingIngredient(ingredient: ingredient);
  }

  Future<Either<Failure, Meal>> searchMealById({required int mealId})async{
    return await _repo.searchMealById(mealId: mealId);
  }

  Future<Either<Failure, Meal>> getRandomMeal()async{
    return await _repo.getRandomMeal();
  }
}