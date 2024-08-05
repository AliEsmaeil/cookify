// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      json['idCategory'] as String,
      json['strCategory'] as String,
      json['strCategoryThumb'] as String,
      json['strCategoryDescription'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'idCategory': instance.id,
      'strCategory': instance.name,
      'strCategoryThumb': instance.imageUrl,
      'strCategoryDescription': instance.description,
    };
