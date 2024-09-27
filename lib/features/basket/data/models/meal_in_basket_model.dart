import 'package:json_annotation/json_annotation.dart';
import 'package:wagba/features/basket/domain/entities/meal_in_basket.dart';

part 'meal_in_basket_model.g.dart';

@JsonSerializable()
final class MealInBasketModel extends MealInBasket{

 const MealInBasketModel(super.mealName, super.imageUrl, super.id, super.numberOfOrderedMeals);

  factory MealInBasketModel.fromJson(Map<String,dynamic> json)=>_$MealInBasketModelFromJson(json);

  Map<String,dynamic> toJson()=> _$MealInBasketModelToJson(this);

  @override
  List<Object?> get props =>[id, mealName, imageUrl, numberOfOrderedMeals];
}