import 'package:dartz/dartz.dart';
import 'package:wagba/core/constants/api_constants.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/core/utils/general_data_getter.dart';
import 'package:wagba/features/home/meal_categories/data/models/meal_in_category_model.dart';
import 'package:wagba/features/home/meal_search/data/models/meal_model.dart';
import 'package:wagba/features/home/meal_search/domain/entities/meal.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

abstract class BaseMealSearchDataSource{

  Future<Either<Failure, List<Meal>>> searchMealByName({required String mealName});

  Future<Either<Failure, List<MealInCategory>>> searchMealContainingIngredient({required String ingredient});

  Future<Either<Failure, Meal>> searchMealById({required String mealId});

  Future<Either<Failure, Meal>> getRandomMeal();

}

final class MealSearchDataSource extends BaseMealSearchDataSource{

  // random meal return a list of meals, where that list contains only one meal
  @override
  Future<Either<Failure, Meal>> getRandomMeal() async{

    try{
      var data = await GeneralDataGetter.getDataFromServer(endPoint: ApiConstants.randomMeal);
      return Right(data['meals'].map((meal)=>MealModel.fromJson(meal)).toList().first);
    }
    on Failure catch(failure){
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, Meal>> searchMealById({required String mealId})async{
    try{
      var data = await GeneralDataGetter.getDataFromServer(endPoint: ApiConstants.searchById , queryParams: {'i' : mealId});
      return Right(data['meals'].map((meal)=>MealModel.fromJson(meal)).toList().first);
    }
    on Failure catch(failure){
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<Meal>>> searchMealByName({required String mealName})async{
    try{
      var data = await GeneralDataGetter.getDataFromServer(endPoint: ApiConstants.searchByNameEndPoint, queryParams: {'s' : mealName});
      return Right(List<Meal>.from((data['meals'] as List).map((m)=>MealModel.fromJson(m))));
    }
    on Failure catch(failure){
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<MealInCategory>>> searchMealContainingIngredient({required String ingredient})async{
    
    try{
      var data = await GeneralDataGetter.getDataFromServer(endPoint: ApiConstants.mealsInCategoryEndpoint, queryParams: {'i' : ingredient});
      return Right(List<MealInCategoryModel>.from((data['meals'] as List).map((meal)=>MealInCategoryModel.fromJson(meal))));
    }
    on Failure catch (failure){
      return Left(failure);
    }

  }

}