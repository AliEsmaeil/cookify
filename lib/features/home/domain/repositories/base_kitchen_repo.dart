import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/domain/entities/kitchen.dart';
import 'package:wagba/features/home/domain/entities/meal_in_category_or_kitchen.dart';

abstract class BaseKitchenRepo{

  const BaseKitchenRepo();

  Future<Either<Failure, List<Kitchen>>> getAllKitchens();

  Future<Either<Failure, List<MealInCategory>>> getMealsInKitchen({required String kitchenName});

}