import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/core/constants/app_visual_properties.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/favorites/presentation/manager/favorites_cubit.dart';
import 'package:wagba/features/favorites/presentation/widgets/fav_item_builder.dart';
import 'package:wagba/features/favorites/presentation/widgets/loading_favs.dart';
import 'package:wagba/features/home/home_presentation/pages/home_screen.dart';
import 'package:wagba/reusable_widgets/custom_toast.dart';

class FavoriteMealsListBuilder extends StatelessWidget {
  const FavoriteMealsListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(true),
      child: BlocBuilder<FavoritesCubit, FavoritesStates>(
        buildWhen: (previous, current){
          return (current is FavoritesLoadingState || current is FavoritesFailureState || current is FavoritesLoadedState);
        },
        builder: (context, state) {
          if (state is FavoritesFailureState) {
            showToast(message: state.failure.message, color: AppColors.toastFailureColor);
            Future.delayed(Duration(seconds: 2) , ()=>Navigator.of(context).pushReplacementNamed(HomeScreen.routeName));
          }
          else if (state is FavoritesLoadedState) {
            return SliverFixedExtentList.builder(
                key: ValueKey(state.meals.length),
                itemCount: state.meals.length,
                itemBuilder: (context, index) =>
                    FavoriteItemBuilder(meal: state.meals[index]),
                itemExtent: context.width / 1.2);
          }
          return LoadingFavoritesWidget();
        },
      ),
    );
  }
}


/*
BlocBuilder<FavoritesCubit, FavoritesStates>(
        builder:(previous, current){
          if(current is FavoritesFailureState){
            // TODO: HANDLE FAILURE
            return Text('Failure in favs');
          }
          else if (current is FavoritesLoadedState){

            return ListView.separated(
                    primary: true,
                    itemCount: current.meals.length,
                    itemBuilder: (context,index)=>FavoriteItemBuilder(meal:  current.meals[index]),
                    separatorBuilder: (context,index)=> 12.verticalSpace,
                    addAutomaticKeepAlives: true,
                    padding: EdgeInsets.all(AppVisualProperties.defaultPadding),
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

                );

          }
          // TODO: HANDLE LOADING
          return Text('loading ...');
        },
      )
 */