import 'package:json_annotation/json_annotation.dart';

abstract class Kitchen{

  //@JsonKey(name: 'strArea',)
  final String name;

  const Kitchen(this.name);
}