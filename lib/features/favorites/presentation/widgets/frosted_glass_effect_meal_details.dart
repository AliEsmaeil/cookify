import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/core/constants/app_visual_properties.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/home/kitchens/presentation/widgets/fav_button.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

class FrostedGlassEffectMealDetails extends StatelessWidget {
 final MealInCategory meal;
  const FrostedGlassEffectMealDetails({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    var id = int.tryParse(meal.id ?? '50') ?? 50;
    return  Expanded(
      child: Container(
            padding: EdgeInsets.all(AppVisualProperties.defaultPadding),
           // color: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade200.withOpacity(.2) : Colors.black38.withOpacity(.2),
            decoration: BoxDecoration(
             color: Theme.of(context).brightness == Brightness.light ? Colors.white:
                 Colors.black38.withOpacity(.5),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppVisualProperties.defaultBorderRadius)),
              border: Border(bottom: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade300: Colors.black54, width: 2,))
            ),
            child: Column(
               children: [
                 Text(
                   meal.mealName ?? 'Backend, forget to name',
                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                     fontWeight: FontWeight.w700,
                     fontFamily: AppVisualProperties.badScriptTextFamily,
                     fontSize: 20.sp,
                   ),
                   maxLines: 1,
                   overflow: TextOverflow.clip,
                 ),
                 8.verticalSpace,

                 Expanded(
                   child: Row(

                     children: [
                       15.horizontalSpace,
                       Text(
                         '\$ ${id % 100}', // suppose this it the price, API doesn't provide price for meal; just mocking
                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
                           color: AppColors.orangeColor,
                           overflow: TextOverflow.ellipsis,
                         ),
                       ),
                       Spacer(),
                       Row(
                         children: [
                           FavoriteHeartButton(meal: meal),
                           IconButton(
                             style: ButtonStyle(
                               backgroundColor: MaterialStatePropertyAll(Colors.orange.shade100),
                               surfaceTintColor:MaterialStatePropertyAll(Colors.orange.shade100),
                             ),
                             icon: Icon(Icons.add, color: AppColors.orangeColor,),
                             onPressed: (){},
                           )
                         ],
                       ),
                       15.horizontalSpace,
                     ],
                   ),
                 ),
               ],
            )
        ),
    );
  }
}
