import 'package:equatable/equatable.dart';
import 'package:wagba/features/basket/data/models/meal_in_basket_model.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

abstract class MealInBasket extends MealInCategory with EquatableMixin{

  final int numberOfOrderedMeals;

  const MealInBasket(super.mealName, super.imageUrl, super.id, this.numberOfOrderedMeals);

  MealInBasketModel convertToModel()=>MealInBasketModel(mealName, imageUrl, id, numberOfOrderedMeals);
}