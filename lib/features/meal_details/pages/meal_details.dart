import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/features/meal_details/manager/meal_details_cubit.dart';
import 'package:wagba/features/meal_details/widgets/meal_sliver_app_bar.dart';
import 'package:wagba/features/meal_details/widgets/no_meals_row.dart';
import 'package:wagba/features/meal_details/widgets/underline_text.dart';
import 'package:wagba/features/meal_details/widgets/youtube_video_widget.dart';

class MealDetailsScreen extends StatelessWidget {

  static const routeName = 'home/mealDetails';
  final MealInCategory meal;

  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          MealSliverAppBar(meal: meal),
          SliverToBoxAdapter(
            child: Column(
              children: [
                NoMealsRow(mealPrice: int.parse(meal.id??'50') %100,), // backend return it as nullable
                Divider(),
                BlocProvider(
                  create: (context)=> MealDetailsCubit(mealId: meal.id??'50'),
                  child: BlocBuilder<MealDetailsCubit, MealDetailsStates>(
                    builder: (context,state){
                      if(state is MealDetailsGotMealState){

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(12.r),
                              child: Column(
                                children: [
                                  UnderlineText(title: 'Classification'),
                                  8.verticalSpace,
                                  Text('From ${state.meal.category} Category in the ${state.meal.kitchen} Kitchen.'),
                                  8.verticalSpace,
                                  UnderlineText(title: 'Ingredients'),
                                  8.verticalSpace,
                                  Text('${state.meal.ingredient1},${state.meal.ingredient2},${state.meal.ingredient3},${state.meal.ingredient4},${state.meal.ingredient5}'),
                                  8.verticalSpace,
                                  UnderlineText(title: 'How Cocked'),
                                  8.verticalSpace,
                                  Text(state.meal.howCocked),
                                  8.verticalSpace,
                                  UnderlineText(title: 'Video Preview'),
                                ],
                              ),
                            ),
                            8.verticalSpace,
                            YouTubeVideoWidget(url: state.meal.youTubeVideoUrl),
                            20.verticalSpace,
                          ],
                        );
                      }
                      else if(state is MealDetailsFailureState){
                        return Text(state.failure.message);
                      }
                      //TODO: IMPLEMENT LOADING
                      return Text('Laoding will be coded');

                    },
                  ),
                ),
              ],
            ),

          ),
        ],
      ),
    );
  }
}
