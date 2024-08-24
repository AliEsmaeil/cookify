import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/home/meal_categories/presentation/manager/category_list_cubit/meal_category_list_cubit.dart';
import 'package:wagba/features/home/meal_categories/presentation/widgets/loading_category_list.dart';
import 'package:wagba/features/home/meal_categories/presentation/widgets/meal_category_item.dart';

class MealCategoryListWidget extends StatelessWidget {
  const MealCategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>MealCategoryListCubit(),
      child: BlocBuilder<MealCategoryListCubit, MealCategoryListStates>(
        builder: (context,state){
          if (state is MealCategoryListLoadedState){
            return SizedBox(
              height: context.height/2.5,
              child: ListView.separated(
                itemBuilder: (context,index){
                  return MealCategoryItem(category: state.categoryList[index]);
                },
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                separatorBuilder: (context,index){
                  return 12.horizontalSpace;
                },
                primary: true,
                itemCount: state.categoryList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                addAutomaticKeepAlives: true,
              ),
            );
          }
          else if(state is MealCategoryListFailureState){
            return Text(state.failure.message);
          }
          else{
            return const LoadingMealCategoryList();
          }
        },
      ),
    );
  }
}
