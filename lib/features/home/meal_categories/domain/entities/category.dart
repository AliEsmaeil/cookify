import 'package:json_annotation/json_annotation.dart';

abstract class MealsCategory{

  @JsonKey(name:'idCategory')
  final String id;

  @JsonKey(name: 'strCategory')
  final String name;

  @JsonKey(name: 'strCategoryThumb')
  final String imageUrl;

  @JsonKey(name: 'strCategoryDescription')
  final String description;

  const MealsCategory(this.id, this.name, this.imageUrl, this.description);

}