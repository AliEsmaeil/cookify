import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/basket/domain/repositories/base_basket_repo.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

final class BasketUseCase{

  final BaseBasketRepo _repo;

  BasketUseCase({required BaseBasketRepo repo}):_repo = repo;

  Future<Either<Failure, bool>> addInBasket({required MealInCategory meal})async{
    return _repo.addInBasket(meal: meal);
  }

  Future<Either<Failure,bool>> removeFromBasket({required String mealId})async{
    return _repo.removeFromBasket(mealId: mealId);
  }

  Future<Either<Failure, List<MealInCategory>>> getAllBasket()async{
    return _repo.getAllBasket();
  }
}