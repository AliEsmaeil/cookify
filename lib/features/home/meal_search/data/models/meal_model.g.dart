// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealModel _$MealModelFromJson(Map<String, dynamic> json) => MealModel(
      json['idMeal'] as String,
      json['strMeal'] as String,
      json['strCategory'] as String,
      json['strArea'] as String,
      json['strInstructions'] as String,
      json['strMealThumb'] as String,
      json['strYouTube'] as String? ??
          'https://www.youtube.com/watch?v=4aZr5hZXP_s',
      json['strIngredient1'] as String?,
      json['strIngredient2'] as String?,
      json['strIngredient3'] as String?,
      json['strIngredient4'] as String?,
      json['strIngredient5'] as String?,
    );

Map<String, dynamic> _$MealModelToJson(MealModel instance) => <String, dynamic>{
      'idMeal': instance.id,
      'strMeal': instance.name,
      'strCategory': instance.category,
      'strArea': instance.kitchen,
      'strInstructions': instance.howCocked,
      'strMealThumb': instance.imageUrl,
      'strYouTube': instance.youTubeVideoUrl,
      'strIngredient1': instance.ingredient1,
      'strIngredient2': instance.ingredient2,
      'strIngredient3': instance.ingredient3,
      'strIngredient4': instance.ingredient4,
      'strIngredient5': instance.ingredient5,
    };
