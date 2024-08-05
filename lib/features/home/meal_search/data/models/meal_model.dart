import 'package:json_annotation/json_annotation.dart';
import 'package:wagba/features/home/meal_search/domain/entities/meal.dart';

part 'meal_model.g.dart';

@JsonSerializable()
class MealModel extends Meal {
  MealModel(
      super.id,
      super.name,
      super.category,
      super.kitchen,
      super.howCocked,
      super.imageUrl,
      super.youTubeVideoUrl,
      super.ingredient1,
      super.ingredient2,
      super.ingredient3,
      super.ingredient4,
      super.ingredient5);

  factory MealModel.fromJson(Map<String,dynamic> json)=>_$MealModelFromJson(json);

  Map<String,dynamic> toJson()=> _$MealModelToJson(this);

}
