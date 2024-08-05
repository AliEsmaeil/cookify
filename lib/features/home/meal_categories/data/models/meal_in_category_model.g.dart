// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_in_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealInCategoryModel _$MealInCategoryModelFromJson(Map<String, dynamic> json) =>
    MealInCategoryModel(
      json['strMeal'] as String?,
      json['strMealThumb'] as String?,
      json['idMeal'] as String?,
    );

Map<String, dynamic> _$MealInCategoryModelToJson(
        MealInCategoryModel instance) =>
    <String, dynamic>{
      'strMeal': instance.mealName,
      'strMealThumb': instance.imageUrl,
      'idMeal': instance.id,
    };
