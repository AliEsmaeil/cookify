import 'package:dartz/dartz.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/kitchens/data/data_sources/kitchen_data_source.dart';
import 'package:wagba/features/home/kitchens/domain/entities/kitchen.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/features/home/kitchens/domain/repositories/base_kitchen_repo.dart';

final class KitchenRepo extends BaseKitchenRepo{

  final BaseKitchenDataSource _dataSource;

  const KitchenRepo({required BaseKitchenDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<Either<Failure, List<Kitchen>>> getAllKitchens() async{
    return await _dataSource.getAllKitchens();
  }

  @override
  Future<Either<Failure, List<MealInCategory>>> getMealsInKitchen({required String kitchenName})async{
    return await _dataSource.getMealsInKitchen(kitchenName: kitchenName);
  }

}