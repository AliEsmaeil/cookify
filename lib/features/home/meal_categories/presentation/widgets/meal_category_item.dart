import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/home/meal_categories/data/models/category_model.dart';
import 'package:wagba/features/home/meal_categories/presentation/pages/meals_in_category_screen.dart';
import 'package:wagba/reusable_widgets/networkImage.dart';

class MealCategoryItem extends StatelessWidget {
  final CategoryModel category;
  const MealCategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //TODO: Navigate to screen presenting meals in category
        Navigator.of(context).pushNamed(MealsInCategoryScreen.routeName, arguments: category);
      },
      child: Container(
        width: (context.width/2) -18 .w,
        child: Card(
          elevation: 10,
          shadowColor: Colors.black38,
          color: AppColors.whiteColor,
          surfaceTintColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.w),
            side: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
          child: Padding(
            padding:  EdgeInsets.all(12.r),
            child: Column(
              children: [
                CustomCachedNetworkImage(
                  imgUrl: category.imageUrl,
                ),
                Text(
                  category.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  )
                ),
                Text(
                  category.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  maxLines: 2,
                )

              ],
            ),
          )
        ),
      ),
    );
  }
}
