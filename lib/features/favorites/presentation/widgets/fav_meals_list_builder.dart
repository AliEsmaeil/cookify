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

    return BlocConsumer<FavoritesCubit, FavoritesStates>(
      
      listener: (context,state){
        if (state is FavoritesFailureState) {
          showToast(message: state.failure.message, color: AppColors.toastFailureColor);
          Future.delayed(Duration(seconds: 2) , ()=>Navigator.of(context).pushReplacementNamed(HomeScreen.routeName));
        }

      },
      builder: (context, state) {

        if (FavoritesCubit.localFavorites.isNotEmpty) {
          return SliverFixedExtentList.builder(
              key: UniqueKey(),
              itemCount: FavoritesCubit.localFavorites.length,
              itemBuilder: (context, index) =>
                  FavoriteItemBuilder(meal: FavoritesCubit.localFavorites[index]),
              itemExtent: context.width / 1.2);
        }
        else if(state is FavoritesLoadingState){
          return const LoadingFavoritesWidget();
        }
        //TODO: IMPLEMENT NO FAVS YET
        return SliverToBoxAdapter(child: Text('YOU DON\'T HAVE ANY FAVS'));
      },
    );
  }
}
