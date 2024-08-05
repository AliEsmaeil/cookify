import 'package:dartz/dartz.dart';
import 'package:wagba/core/constants/api_constants.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/core/utils/general_data_getter.dart';
import 'package:wagba/features/home/meal_categories/data/models/category_model.dart';
import 'package:wagba/features/home/meal_categories/data/models/meal_in_category_model.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/category.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

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
      //data['categories'].map((c) => CategoryModel.fromJson(c)).toList() causes error becasue it return List<dynamic> despite narrowing casting

      var mealCategories = <CategoryModel>[];
      data['categories'].forEach((cat){
        mealCategories.add(CategoryModel.fromJson(cat));
      });

      return Right(mealCategories);
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

      // data['meals'].map((meal) => MealInCategoryModel.fromJson(meal)).toList()  causes the same error

      var mealsInCategory = <MealInCategoryModel>[];
      data['meals'].forEach((meal){
        mealsInCategory.add(MealInCategoryModel.fromJson(meal));
      });

      return Right(mealsInCategory);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

}
