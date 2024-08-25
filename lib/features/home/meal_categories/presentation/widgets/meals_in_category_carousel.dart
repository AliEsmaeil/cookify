import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/home/kitchens/presentation/widgets/meal_in_kitchen.dart';
import 'package:wagba/features/home/meal_categories/data/models/category_model.dart';
import 'package:wagba/features/home/meal_categories/presentation/manager/meals_in_category_cubit/meals_in_category_cubit.dart';
import 'package:wagba/features/home/meal_categories/presentation/widgets/loading_category_list.dart';

class MealsInCategoryCarousel extends StatelessWidget {

  final CategoryModel category;

  const MealsInCategoryCarousel({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>MealsInCategoryCubit(category: category ),
      child: BlocBuilder<MealsInCategoryCubit, MealsInCategoryStates>(
        builder: (context, state) {
          if(state is MealsInCategoryLoadedState){
            return CarouselSlider(
              options: CarouselOptions(
                height: context.height / 2.5,
                autoPlay: false,
                padEnds: true,
                scrollDirection: Axis.horizontal,
                enableInfiniteScroll: true,
                initialPage: 0,
                scrollPhysics: BouncingScrollPhysics(),
                enlargeCenterPage: true,
                viewportFraction: .5,
                enlargeFactor: .37,
              ),
              items: state.mealInCategory.map((meal) => MealInKitchenOrCategory(meal: meal,)).toList(),
            );

          }
          else if(state is MealsInCategoryFailureState){
            return Text('Failure , ${state.failure}');
          }
          return LoadingMealCategoryList();
        },
      ),
    );
  }
}
