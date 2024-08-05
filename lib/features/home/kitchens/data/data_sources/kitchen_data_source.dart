import 'package:dartz/dartz.dart';
import 'package:wagba/core/constants/api_constants.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/core/utils/dio_singleton.dart';
import 'package:wagba/core/utils/general_data_getter.dart';
import 'package:wagba/features/home/kitchens/data/models/kitchen_model.dart';
import 'package:wagba/features/home/meal_categories/data/models/meal_in_category_model.dart';
import 'package:wagba/features/home/kitchens/domain/entities/kitchen.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/features/home/meal_search/domain/entities/meal.dart';

abstract class BaseKitchenDataSource {

  Future<Either<Failure, List<Kitchen>>> getAllKitchens();

  Future<Either<Failure, List<MealInCategory>>> getMealsInKitchen({required String kitchenName});
}

final class KitchenDataSource extends BaseKitchenDataSource {
  @override
  Future<Either<Failure, List<Kitchen>>> getAllKitchens() async {
    try {
      var data = await GeneralDataGetter.getDataFromServer(
          endPoint: ApiConstants.kitchenEndPoint, queryParams: {'a': 'list'});
      //data['meals'].map((kitchen)=>KitchenModel.fromJson(kitchen)
      var kitchens = <KitchenModel>[];
      data['meals'].forEach((kitchen){
        kitchens.add(KitchenModel.fromJson(kitchen));
      });
      return Right(kitchens);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<MealInCategory>>> getMealsInKitchen({required String kitchenName}) async{
    try{
      var data = await GeneralDataGetter.getDataFromServer(endPoint: ApiConstants.mealsInCategoryEndpoint, queryParams: {'a' : kitchenName});

      //data['meals'].map((mealInKitchen)=>MealInCategoryModel.fromJson(mealInKitchen)).toList()

      var mealsInKitchen = <MealInCategoryModel>[];
      data['meals'].forEach((meal){
        mealsInKitchen.add(MealInCategoryModel.fromJson(meal));
      });

      return Right(mealsInKitchen);
    }
    on Failure catch(failure){
      return Left(failure);
    }
  }
}
