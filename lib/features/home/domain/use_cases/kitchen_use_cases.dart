import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/domain/entities/kitchen.dart';
import 'package:wagba/features/home/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/features/home/domain/repositories/base_kitchen_repo.dart';

final class KitchenUseCases {

  final BaseKitchenRepo _repo;

  const KitchenUseCases({required BaseKitchenRepo repo}):_repo = repo;

  Future<Either<Failure, List<Kitchen>>> getAllKitchens()async{
    return await _repo.getAllKitchens();
  }

  Future<Either<Failure, List<MealInCategory>>> getMealsInKitchen({required String kitchenName})async{
    return await _repo.getMealsInKitchen(kitchenName: kitchenName);
  }
}