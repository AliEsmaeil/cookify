import 'package:json_annotation/json_annotation.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

part 'meal_in_category_model.g.dart';

@JsonSerializable()
class MealInCategoryModel extends MealInCategory{
  const MealInCategoryModel(super.mealName, super.imageUrl, super.id);

  factory MealInCategoryModel.fromJson(Map<String,dynamic> json)=>_$MealInCategoryModelFromJson(json);

  Map<String,dynamic> toJson()=>_$MealInCategoryModelToJson(this);

}