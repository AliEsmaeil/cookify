import 'package:wagba/features/home/kitchens/domain/entities/kitchen.dart';

// no need to generate a dedicated serialization file for a model containing only one variable

final class KitchenModel extends Kitchen{
  const KitchenModel(super.name);

   factory KitchenModel.fromJson(Map<String,dynamic> json)=>KitchenModel(json['strArea']);

   Map<String,dynamic> toJson()=>{'strArea' : name};

}