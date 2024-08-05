import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/category.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

abstract class BaseCategoryRepo{

  const BaseCategoryRepo();

  Future<Either<Failure, List<MealsCategory>>> getAllCategories();

  Future<Either<Failure, List<MealInCategory>>> getMealsInCategory({required String categoryName});

}