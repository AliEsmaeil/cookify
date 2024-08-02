import 'package:json_annotation/json_annotation.dart';
import 'package:wagba/features/home/domain/entities/category.dart';

part 'generated/meal_in_category_model.g.dart';

@JsonSerializable()
class MealInCategoryModel extends MealsCategory{

  const MealInCategoryModel(super.id, super.name, super.imageUrl, super.description);

  factory MealInCategoryModel.fromJson(Map<String,dynamic> json)=>_$MealInCategoryModelFromJson(json);

  Map<String,dynamic> toJson()=>_$MealInCategoryModelToJson(this);

}