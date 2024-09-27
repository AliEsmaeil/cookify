import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/basket/data/data_sources/base_basket_data_source.dart';
import 'package:wagba/features/basket/domain/entities/meal_in_basket.dart';
import 'package:wagba/features/basket/domain/repositories/base_basket_repo.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

final class BasketRepo extends BaseBasketRepo{

  final BaseBasketDataSource _dataSource;

  BasketRepo({required BaseBasketDataSource dataSource}): _dataSource = dataSource;


  @override
  Future<Either<Failure, bool>> addInBasket({required MealInBasket meal})async{
    return _dataSource.addInBasket(meal: meal);
  }

  @override
  Future<Either<Failure,bool>> removeFromBasket({required String mealId})async{
    return _dataSource.removeFromBasket(mealId: mealId);

  }

  @override
  Future<Either<Failure, List<MealInBasket>>> getAllBasket(){
    return _dataSource.getAllBasket();
  }
}