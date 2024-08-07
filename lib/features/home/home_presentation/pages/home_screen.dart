import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/features/home/home_presentation/manager/home_cubit.dart';
import 'package:wagba/features/home/home_presentation/pages/tabs/basket_tab.dart';
import 'package:wagba/features/home/home_presentation/pages/tabs/favorites_tab.dart';
import 'package:wagba/features/home/home_presentation/pages/tabs/home_tab.dart';
import 'package:wagba/features/home/home_presentation/pages/tabs/settings_teb.dart';
import 'package:wagba/features/home/home_presentation/widgets/bottom_nav_bar.dart';
import 'package:wagba/features/home/home_presentation/widgets/home_sliver_appbar.dart';
import 'package:wagba/features/home/kitchens/presentation/kitchens_view/kitchens_view.dart';
import 'package:wagba/features/home/meal_categories/presentation/meal_Category_list_widget/meal_category_list_widget.dart';


class HomeScreen extends StatelessWidget {

  static const routeName = 'home';

  //final UserCredential? userCredential;

  const HomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {


        },
        builder: (context, state) {
          var cubit = HomeCubit.getCubit(context);
          return Scaffold(
            body: cubit.tab,
            bottomNavigationBar: BottomNavBar(
              chosenIndex: cubit.tabIndex,
              onTap: (index)=>cubit.changeTab(index),
            ),
          );
        },
      ),
    );
  }
}

