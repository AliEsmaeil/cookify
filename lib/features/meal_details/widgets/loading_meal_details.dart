import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/reusable_widgets/loading_container.dart';

class LoadingMealDetails extends StatelessWidget {
  const LoadingMealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // ingredients and classification sections
        for(int i =0 ; i < 2 ; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoadingContainer(width: context.width/2,height: 25.h,),
              5.verticalSpace,
              LoadingContainer(width:context.width , height: 120.h,),
              10.verticalSpace,
            ],
          ),
        5.verticalSpace,
        // How cocked and video sections
        for(int i =0 ; i < 2 ; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoadingContainer(width: context.width/2,height: 25.h,),
              5.verticalSpace,
              LoadingContainer(width:context.width , height: context.width,),
              10.verticalSpace,
            ],
          )
      ],
    );
  }
}
