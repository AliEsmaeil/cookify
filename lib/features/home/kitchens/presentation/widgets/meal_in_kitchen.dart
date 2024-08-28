import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/home/kitchens/presentation/widgets/add_basket_button.dart';
import 'package:wagba/features/home/kitchens/presentation/widgets/fav_button.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/features/meal_details/pages/meal_details.dart';
import 'package:wagba/reusable_widgets/networkImage.dart';

class MealInKitchenOrCategory extends StatelessWidget {

  final MealInCategory meal;

  const MealInKitchenOrCategory({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {

    int id = int.parse(meal.id ?? '50');
        return Card(
          child: Container(
            width: context.width/2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: Column(
              children: [

                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed(MealDetailsScreen.routeName, arguments: meal);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
                      child: Hero(
                        tag: meal.id.toString(),
                        child: CustomCachedNetworkImage(
                          imgUrl: meal.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                5.verticalSpace,

                Expanded(
                  flex : 2,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      children: [
                        Text(
                          meal.mealName ?? 'Backend, forget to name',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                        8.verticalSpace,

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$ ${id % 100}', // suppose this it the price, API doesn't provide price for meal; just mocking
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.orangeColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                children: [
                                  FavoriteHeartButton(meal: meal),
                                  AddInBasketButton(meal: meal),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

          ),
        );
  }
}
