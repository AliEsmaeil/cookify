import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/data/models/Category_model.dart';
import 'package:wagba/features/home/data/models/meal_in_category_model.dart';
import 'package:wagba/features/home/domain/entities/category.dart';
import 'package:wagba/features/home/domain/entities/meal_in_category_or_kitchen.dart';

abstract class BaseCategoryRepo{

  Future<Either<Failure, List<MealsCategory>>> getAllCategories();

  Future<Either<Failure, List<MealInCategory>>> getMealsInCategory();

}