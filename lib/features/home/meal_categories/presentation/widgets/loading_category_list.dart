import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/reusable_widgets/loading_container.dart';

class LoadingMealCategoryList extends StatelessWidget {
  const LoadingMealCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height/2.5,
      child: ListView.separated(
        itemCount: 14,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index)=>SizedBox(width : (context.width / 2)-18.w ,
            child: LoadingContainer()),
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        separatorBuilder: (context,index){
          return 12.horizontalSpace;
        },
      ),
    );
  }
}
