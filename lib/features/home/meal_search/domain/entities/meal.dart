import 'package:json_annotation/json_annotation.dart';

abstract class Meal {

  @JsonKey(name: 'idMeal')
  final String id;

  @JsonKey(name: 'strMeal')
  final String name;

  @JsonKey(name: 'strCategory')
  final String category;

  @JsonKey(name: 'strArea')
  final String kitchen;

  @JsonKey(name: 'strInstructions')
  final String howCocked;

  @JsonKey(name: 'strMealThumb')
  final String imageUrl;

  @JsonKey(name: 'strYouTube', defaultValue: "https://www.youtube.com/watch?v=4aZr5hZXP_s")
  final String youTubeVideoUrl;

/*
   IMPORTANT NOTE: The developer of this API has missed important thing he was trying to provide clients with all
   the ingredients of the meal (normally it should be a List<String> containing all of the ingrediants)
   but he provide the ingredients as separated strings like :

      "strIngredient1": "Plain Flour",
      "strIngredient2": "Caster Sugar",
      "strIngredient3": "Butter",
      "strIngredient4": "Braeburn Apples",
      "strIngredient5": "Butter",
      "strIngredient6": "Demerara Sugar",
      "strIngredient7": "Blackberrys",
      "strIngredient8": "Cinnamon",
      "strIngredient9": "Ice Cream",
      "strIngredient10": "",
      "strIngredient11": "",
      "strIngredient12": "",
      "strIngredient13": "",
      "strIngredient14": "",
      "strIngredient15": "",
      "strIngredient16": "",
      "strIngredient17": "",
      "strIngredient18": "",
      "strIngredient19": "",
      "strIngredient20": "",

      // which is bad practice, and missy how could the client handle those 20 strings, so , we will try.
   */

  @JsonKey(name: 'strIngredient1')
  final String? ingredient1;
  @JsonKey(name: 'strIngredient2')
  final String? ingredient2;
  @JsonKey(name: 'strIngredient3')
  final String? ingredient3;
  @JsonKey(name: 'strIngredient4')
  final String? ingredient4;
  @JsonKey(name: 'strIngredient5')
  final String? ingredient5;

  Meal(
      this.id,
      this.name,
      this.category,
      this.kitchen,
      this.howCocked,
      this.imageUrl,
      this.youTubeVideoUrl,
      this.ingredient1,
      this.ingredient2,
      this.ingredient3,
      this.ingredient4,
      this.ingredient5);
}
