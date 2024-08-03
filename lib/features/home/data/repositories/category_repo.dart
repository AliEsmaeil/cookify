import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/data/data_sources/category_data_source.dart';
import 'package:wagba/features/home/domain/entities/category.dart';
import 'package:wagba/features/home/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/features/home/domain/repositories/base_category_repo.dart';

final class CategoryRepo extends BaseCategoryRepo{

  final BaseCategoryDataSource _dataSource;

  const CategoryRepo({required BaseCategoryDataSource dataSource}):_dataSource = dataSource;

  @override
  Future<Either<Failure, List<MealsCategory>>> getAllCategories() async{
    return await _dataSource.getAllCategories();
  }

  @override
  Future<Either<Failure, List<MealInCategory>>> getMealsInCategory({required String categoryName})async {
   return await _dataSource.getMealsInCategory(categoryName: categoryName);
  }

}