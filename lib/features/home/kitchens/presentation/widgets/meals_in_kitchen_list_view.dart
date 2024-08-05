import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/home/kitchens/presentation/widgets/meal_in_kitchen.dart';
import 'package:wagba/features/home/meal_categories/data/models/meal_in_category_model.dart';

class MealsInKitchenOrCategoryListView extends StatelessWidget {

  final List<MealInCategoryModel> meals;

  const MealsInKitchenOrCategoryListView({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 2,
      child: ListView.separated(
          itemBuilder: (context,index)=>MealInKitchenOrCategory(meal: meals[index]),
          separatorBuilder: (context, index)=>12.horizontalSpace,
          itemCount: meals.length,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
      )
    );
  }
}
