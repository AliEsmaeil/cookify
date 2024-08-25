import 'package:json_annotation/json_annotation.dart';
import 'package:wagba/features/home/meal_categories/data/models/meal_in_category_model.dart';

abstract class MealInCategory{

  @JsonKey(name: 'strMeal')
  final String? mealName;

  @JsonKey(name: 'strMealThumb')
  final String? imageUrl;

  @JsonKey(name: 'idMeal')
  final String? id;

 const MealInCategory(this.mealName, this.imageUrl, this.id);

  MealInCategoryModel toModel()=>MealInCategoryModel(mealName, imageUrl, id);

}

