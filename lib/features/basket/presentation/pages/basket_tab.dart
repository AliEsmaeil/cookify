import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/features/basket/presentation/manager/basket_cubit.dart';
import 'package:wagba/features/basket/presentation/widgets/basket_meals_builder.dart';
import 'package:wagba/features/home/home_presentation/pages/home_screen.dart';
import 'package:wagba/reusable_widgets/custom_toast.dart';
import 'package:wagba/reusable_widgets/tab_sliver_app_bar.dart';
import 'package:wagba/reusable_widgets/tab_sliver_search_field.dart';

class BasketTab extends StatelessWidget {
  const BasketTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      primary: true,
      slivers: [
        TabSliverAppBar(tabTitle: 'Basket'),
        TabSliverSearchField(
          hintText: 'Search Meals in Basket',
          suggestionsBuilder: BasketCubit.basketSuggestionBuilder,
        ),
        BasketMealsBuilder(),
      ],
    );
  }
}
