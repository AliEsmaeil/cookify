import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/home/kitchens/presentation/manager/kitchens_view_cubit.dart';
import 'package:wagba/features/home/kitchens/presentation/widgets/kitchen_tab.dart';
import 'package:wagba/features/home/kitchens/presentation/widgets/loading_kitchen_view.dart';

class KitchensView extends StatelessWidget {
  const KitchensView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370.h,
      child: BlocProvider(
        create: (context) => KitchensViewCubit(),
        child: BlocBuilder<KitchensViewCubit, KitchensViewStates>(
          builder: (context, state) {
            var cubit = KitchensViewCubit.getCubit(context);
            if (cubit.kitchens.isEmpty) {
              return LoadingKitchenView();
            }
            else {
              print('build for state :$state');
              return DefaultTabController(
                length: cubit.kitchens.length,
                initialIndex: 0,
                animationDuration: const Duration(seconds: 2),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.w),
                        child: TabBar(
                          tabs: cubit.kitchens
                              .map((k) => KitchenTab(kitchenName: k.name))
                              .toList(),
                          onTap: (index) => cubit.putMealsForKitchen(index: index),
                          physics: BouncingScrollPhysics(),
                          isScrollable: true,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          key: ValueKey(cubit.tabBarViewKey),
                          children: cubit.mealsInKitchen,
                        ),
                      ),
                    ],
                  ),
              );
            }
          },
        ),
      ),
    );
  }
}
