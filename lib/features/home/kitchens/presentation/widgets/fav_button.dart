import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/features/favorites/presentation/manager/favorites_cubit.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

class FavoriteHeartButton extends StatefulWidget {
  final MealInCategory meal;

  const FavoriteHeartButton({super.key, required this.meal});

  @override
  State<FavoriteHeartButton> createState() => _FavoriteHeartButtonState();
}

class _FavoriteHeartButtonState extends State<FavoriteHeartButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      vsync: this, value: 1, duration: const Duration(milliseconds: 400));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<FavoritesCubit, FavoritesStates>(

      builder: (BuildContext context, FavoritesStates state) {

        var cubit = FavoritesCubit.getCubit(context: context);
        bool isFav = cubit.isInFavorites(mealId: widget.meal.id ?? '50');

        return ScaleTransition(
          scale: Tween<double>(begin: 0.7, end: 1).animate(
              CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? AppColors.favColor : AppColors.notFavColor,
            ),
            onPressed: () {
              _controller.reverse().then((value) => _controller.forward());
              Timer(const Duration(milliseconds: 400), () =>
                  cubit.toggleFavorite(meal: widget.meal));
            },
          ),
        );
      },
    );
  }
}
