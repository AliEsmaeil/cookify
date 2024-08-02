import 'package:json_annotation/json_annotation.dart';

abstract class MealInCategory{

  @JsonKey(name: 'strMeal')
  final String mealName;

  @JsonKey(name: 'strMealThumb')
  final String imageUrl;

  @JsonKey(name: 'idMeal')
  final int id;

 const MealInCategory(this.mealName, this.imageUrl, this.id);

}

