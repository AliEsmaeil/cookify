import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/features/home/meal_categories/data/models/category_model.dart';
import 'package:wagba/features/home/meal_categories/data/models/meal_in_category_model.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/features/home/meal_categories/presentation/widgets/meals_in_category_carousel.dart';
import 'package:wagba/features/meal_details/widgets/meal_sliver_app_bar.dart';
import 'package:wagba/features/meal_details/widgets/underline_text.dart';

class MealsInCategoryScreen extends StatelessWidget {

  static const routeName = '/home/mealsInCategory';
  final CategoryModel category;
  const MealsInCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          MealSliverAppBar(meal: MealInCategoryModel('${category.name} Category', category.imageUrl, category.id)),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: EdgeInsets.all(12.r),
                  child: UnderlineText(title: 'Category Meals'),
                ),
                MealsInCategoryCarousel(category: category,),

                Padding(padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  UnderlineText(title: 'Category Description'),
                  Text(
                    category.description,
                  ),
                ],),)
              ],
            ),
          )
        ],
    )
    );
  }
}
