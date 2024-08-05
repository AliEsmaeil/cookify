import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/home/meal_categories/presentation/widgets/loading_category_list.dart';
import 'package:wagba/reusable_widgets/loading_container.dart';

class LoadingKitchenView extends StatelessWidget {
  const LoadingKitchenView({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          SizedBox(
            height: 60.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(16.w),
                itemBuilder: (context,index)=>LoadingContainer(width: context.width/4, height: 60.h) ,
                separatorBuilder: (context,index)=> 16.horizontalSpace,
                itemCount: 16  // suppose they are sixteen
            ),
          ),

          Expanded(child: LoadingMealCategoryList()),
        ],
      );
  }
}
