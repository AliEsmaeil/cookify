import 'package:dartz/dartz.dart';
import 'package:wagba/core/constants/firebase_constants.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/basket/domain/entities/meal_in_basket.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

abstract class BaseBasketDataSource{

  final db = FireStoreConstants.db;
  final auth = FireStoreConstants.auth;

  Future<Either<Failure, bool>> addInBasket({required MealInBasket meal});

  Future<Either<Failure,bool>> removeFromBasket({required String mealId});

  Future<Either<Failure, List<MealInBasket>>> getAllBasket();

}