import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/core/utils/dio_singleton.dart';
import 'package:wagba/features/home/domain/entities/kitchen.dart';
import 'package:wagba/features/home/domain/entities/meal_in_category_or_kitchen.dart';

abstract class BaseKitchenDataSource{

  final _dio = DioSingleton.getInstance();

  Future<Either<Failure, List<Kitchen>>> getAllKitchens();

  Future<Either<Failure, List<MealInCategory>>> getMealsInKitchen();

}