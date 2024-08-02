import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/core/utils/dio_singleton.dart';
import 'package:wagba/features/home/domain/entities/category.dart';
import 'package:wagba/features/home/domain/entities/meal_in_category_or_kitchen.dart';

abstract class BaseCategoryDataSource{

  final _dio = DioSingleton.getInstance();

  Future<Either<Failure, List<MealsCategory>>> getAllCategories();

  Future<Either<Failure, List<MealInCategory>>> getMealsInCategory();

}