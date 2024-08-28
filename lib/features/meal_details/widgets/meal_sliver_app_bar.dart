import 'package:flutter/material.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/reusable_widgets/networkImage.dart';
import 'package:wagba/core/extensions/string_manipulation.dart';

class MealSliverAppBar extends StatelessWidget {
  final MealInCategory meal;

  const MealSliverAppBar({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.orangeColor,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_ios_new_rounded),
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(
              Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.black),
          backgroundColor:
              MaterialStatePropertyAll(Colors.grey.shade100.withOpacity(.4)),
        ),
      ),
      stretch: true,
      expandedHeight: context.height / 2,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: meal.id.toString(),
          child: CustomCachedNetworkImage(
            imgUrl: meal.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          meal.mealName?.customizeForSliverOrAppBarTitle() ?? 'backed forget naming',
          softWrap: false,
          overflow: TextOverflow.clip,
        ),
        expandedTitleScale: 2,
        stretchModes: [
          StretchMode.zoomBackground,
          //StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
      ),
    );
  }
}
