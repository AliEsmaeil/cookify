// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_in_basket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealInBasketModel _$MealInBasketModelFromJson(Map<String, dynamic> json) =>
    MealInBasketModel(
      json['strMeal'] as String?,
      json['strMealThumb'] as String?,
      json['idMeal'] as String?,
      (json['numberOfOrderedMeals'] as num).toInt(),
    );

Map<String, dynamic> _$MealInBasketModelToJson(MealInBasketModel instance) =>
    <String, dynamic>{
      'strMeal': instance.mealName,
      'strMealThumb': instance.imageUrl,
      'idMeal': instance.id,
      'numberOfOrderedMeals': instance.numberOfOrderedMeals,
    };
