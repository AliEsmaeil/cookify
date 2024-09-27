import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/basket/domain/entities/meal_in_basket.dart';
import 'package:wagba/reusable_widgets/networkImage.dart';

class MealInBasketBuilder extends StatelessWidget {
  final MealInBasket meal;

  const MealInBasketBuilder({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        child: CustomCachedNetworkImage(
          fit: BoxFit.contain,
          imgUrl: meal.imageUrl,
        ),
      ),
      minTileHeight: 100.h,
      titleAlignment: ListTileTitleAlignment.top,
      horizontalTitleGap: 20,
      minLeadingWidth: context.width/5,
      title: Text(meal.mealName?? 'Backend Prop', maxLines: 1,),
      subtitle:  Text('${meal.numberOfOrderedMeals} ${meal.numberOfOrderedMeals > 1 ? 'Packs' : 'Pack'}'),
      trailing: Text('\$ ${meal.numberOfOrderedMeals * (int.parse(meal.id?? '50') % 100) }'),
    );
  }
}
