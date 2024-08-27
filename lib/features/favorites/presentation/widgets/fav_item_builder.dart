import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/core/constants/app_visual_properties.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/favorites/presentation/manager/favorites_cubit.dart';
import 'package:wagba/features/favorites/presentation/widgets/frosted_glass_effect_meal_details.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/features/meal_details/pages/meal_details.dart';
import 'package:wagba/reusable_widgets/networkImage.dart';

class FavoriteItemBuilder extends StatelessWidget {

  //final GlobalKey<DismissibleState> dimissKey = GlobalKey<DismissibleState>();
  final MealInCategory meal;

  const FavoriteItemBuilder({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    var cubit = FavoritesCubit.getCubit(context: context);
    return GestureDetector(
      onTap: ()=>Navigator.of(context).pushNamed(MealDetailsScreen.routeName, arguments: meal),
      child: Dismissible(
        key: ValueKey(meal.id),
        direction: DismissDirection.horizontal,
        movementDuration: Duration(seconds: 1),
        onDismissed: (dismissDirection)=> cubit.removeFavorite(mealId: meal.id ?? '50'),
        child: Padding(
          padding: EdgeInsets.only(
            left: AppVisualProperties.defaultPadding,
            right: AppVisualProperties.defaultPadding,
            bottom: AppVisualProperties.defaultPadding*1.5,
          ),
          child: Column(
            children: [
              Hero(
                tag: meal.id?? '50',
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(AppVisualProperties.defaultBorderRadius)),
                  child: CustomCachedNetworkImage(
                    fit: BoxFit.cover,
                    imgUrl: meal.imageUrl,
                    width: double.infinity,
                    height: context.width / 2,
                  ),
                ),
              ),
               FrostedGlassEffectMealDetails(
                  meal: meal,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
