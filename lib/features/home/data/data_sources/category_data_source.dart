import 'package:dartz/dartz.dart';
import 'package:wagba/core/constants/api_constants.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/core/utils/dio_singleton.dart';
import 'package:wagba/core/utils/general_data_getter.dart';
import 'package:wagba/features/home/data/models/Category_model.dart';
import 'package:wagba/features/home/data/models/meal_in_category_model.dart';
import 'package:wagba/features/home/domain/entities/category.dart';
import 'package:wagba/features/home/domain/entities/meal_in_category_or_kitchen.dart';

abstract class BaseCategoryDataSource {
  Future<Either<Failure, List<MealsCategory>>> getAllCategories();

  Future<Either<Failure, List<MealInCategory>>> getMealsInCategory({required String categoryName});
}

final class CategoryDataSource extends BaseCategoryDataSource {
  @override
  Future<Either<Failure, List<MealsCategory>>> getAllCategories() async {
    try {
      var data = await GeneralDataGetter.getDataFromServer(
          endPoint: ApiConstants.categoriesEndPoint);
      return Right(
          data['categories'].map((c) => CategoryModel.fromJson(c)).toList());
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<MealInCategory>>> getMealsInCategory(
      {required String categoryName}) async {
    try {
      var data = await GeneralDataGetter.getDataFromServer(
          endPoint: ApiConstants.mealsInCategoryEndpoint,
          queryParams: {'c': categoryName});
      return Right(data['meals'].map((meal) => MealInCategoryModel.fromJson(meal)).toList());
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
