import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/features/home/home_presentation/widgets/home_sliver_appbar.dart';
import 'package:wagba/features/home/kitchens/presentation/kitchens_view/kitchens_view.dart';
import 'package:wagba/features/home/meal_categories/presentation/meal_Category_list_widget/meal_category_list_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(parent: ClampingScrollPhysics()),
      slivers: [
        HomeSliverAppBar(),

        SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  'Meal Categories',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                10.verticalSpace,
                MealCategoryListWidget(),

                Text(
                  'Kitchens',
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                KitchensView(),
                15.verticalSpace,

              ],
            )
        )
      ],
    );
  }
}
