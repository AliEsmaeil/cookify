import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/features/home/home_presentation/manager/home_cubit.dart';
import 'package:wagba/features/home/home_presentation/widgets/home_sliver_appbar.dart';
import 'package:wagba/features/home/kitchens/presentation/kitchens_view/kitchens_view.dart';
import 'package:wagba/features/home/meal_categories/presentation/meal_Category_list_widget/meal_category_list_widget.dart';
import 'package:wagba/reusable_widgets/loading_container.dart';


class HomeScreen extends StatelessWidget {

  static const routeName = 'home';
  //final UserCredential? userCredential;

  const HomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
          body: CustomScrollView(
            physics: BouncingScrollPhysics(parent: ClampingScrollPhysics()),
             slivers: [
               HomeSliverAppBar(),

               SliverToBoxAdapter(
                 child: Column(
                   children: [
                     Text(
                       'Meal Categories',
                       style: Theme.of(context).textTheme.titleMedium,
                     ),
                     10.verticalSpace,
                     MealCategoryListWidget(),

                     Text(
                       'Kitchens',
                       style: Theme.of(context).textTheme.titleMedium,
                     ),

                     KitchensView(),

                   ],
                 )
               )
             ],
          ),
      ),
    );
  }
}
