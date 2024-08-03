import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/domain/entities/category.dart';
import 'package:wagba/features/home/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/features/home/domain/repositories/base_category_repo.dart';

final class MealCategoryUseCase{

  final BaseCategoryRepo _repo;

  const MealCategoryUseCase({required BaseCategoryRepo repo}): _repo = repo;

  Future<Either<Failure, List<MealsCategory>>> getAllCategories()async{
    return await _repo.getAllCategories();
  }

  Future<Either<Failure, List<MealInCategory>>> getMealsInCategory({required String categoryName})async{
    return await _repo.getMealsInCategory(categoryName: categoryName);
  }
}