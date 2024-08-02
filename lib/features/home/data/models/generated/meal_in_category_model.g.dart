// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../meal_in_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealInCategoryModel _$MealInCategoryModelFromJson(Map<String, dynamic> json) =>
    MealInCategoryModel(
      (json['idCategory'] as num).toInt(),
      json['strCategory'] as String,
      json['strCategoryThumb'] as String,
      json['strCategoryDescription'] as String,
    );

Map<String, dynamic> _$MealInCategoryModelToJson(
        MealInCategoryModel instance) =>
    <String, dynamic>{
      'idCategory': instance.id,
      'strCategory': instance.name,
      'strCategoryThumb': instance.imageUrl,
      'strCategoryDescription': instance.description,
    };
