import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/features/basket/presentation/manager/basket_cubit.dart';
import 'package:wagba/features/basket/presentation/widgets/checkout_section.dart';
import 'package:wagba/features/basket/presentation/widgets/meal_in_bsket_builder.dart';
import 'package:wagba/features/favorites/presentation/widgets/loading_favs.dart';
import 'package:wagba/features/home/home_presentation/pages/home_screen.dart';
import 'package:wagba/reusable_widgets/custom_toast.dart';

class BasketMealsBuilder extends StatelessWidget {
  const BasketMealsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketCubit, BasketStates>(
      listener: (context, state) {
        if (state is BasketMealsFailureState) {
          showToast(
              message: state.failure.message,
              color: AppColors.toastFailureColor);
          Future.delayed(
              Duration(seconds: 2),
              () => Navigator.of(context)
                  .pushReplacementNamed(HomeScreen.routeName));
        }
      },
      builder: (context, state) {
        var cubit = BasketCubit.getCubit(context);

        if (BasketCubit.mealsInBasket.isNotEmpty) {
          return
            SliverFillRemaining(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      key: UniqueKey(),
                      children: [
                        ...List.generate(BasketCubit.mealsInBasket.length, (index)=>MealInBasketBuilder(
                          meal: BasketCubit.mealsInBasket[index],
                        ),),

                        CheckoutSection(),
                      ],
                    ),
                  ),

                ],
              ),
            );

        } else if (state is BasketMealsLoadingState) {
          return const LoadingFavoritesWidget();
        }
        //TODO: IMPLEMENT NO Basket YET
        return SliverToBoxAdapter(
          child: Center(
              child: Text('You don\'t have any Meals In Your Basket Yet.')),
        );
      },
    );
  }
}
