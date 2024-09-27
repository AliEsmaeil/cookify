import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/features/basket/data/models/meal_in_basket_model.dart';
import 'package:wagba/features/basket/domain/entities/meal_in_basket.dart';
import 'package:wagba/features/basket/presentation/manager/basket_cubit.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

class AddInBasketButton extends StatefulWidget {
  final MealInCategory meal;

  const AddInBasketButton({super.key, required this.meal});

  @override
  State<AddInBasketButton> createState() => _AddInBasketButtonState();
}

class _AddInBasketButtonState extends State<AddInBasketButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
      vsync: this, value: 1, duration: const Duration(milliseconds: 400));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCubit, BasketStates>(
       builder: (context, state) {
          var cubit = BasketCubit.getCubit(context);
          bool isInBasket =cubit.isInBasket(meal: MealInBasketModel(widget.meal.mealName, widget.meal.imageUrl, widget.meal.id, 1));

            return ScaleTransition(
              scale: Tween<double>(begin: .5, end: 1).animate(CurvedAnimation(
                  parent: animationController, curve: Curves.easeOut)),
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(isInBasket? Colors.transparent: Colors.orange.shade100),
                  foregroundColor: WidgetStatePropertyAll(isInBasket? AppColors.orangeColor: Colors.orange),
                ),
                icon: Icon(
                  isInBasket ? Icons.shopping_basket_rounded : Icons.add,
                ),
                onPressed: () {
                  animationController
                      .reverse()
                      .then((value) => animationController.forward());
                  Timer(const Duration(milliseconds: 400),
                      () => cubit.toggleMealInBasket(meal: MealInBasketModel(widget.meal.mealName, widget.meal.imageUrl, widget.meal.id, 1)));
                },
              ),
            );
          }
      );
  }
}
