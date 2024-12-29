import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/core/extensions/context_extension.dart';

class MealHubContainer extends StatelessWidget {
  const MealHubContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: AppColors.orangeColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.w) , bottomRight: Radius.circular(16.w)),
         ),
      width: context.width /2 ,
      height: 40.h,
      child: Center(
        child: Text(
          'Cookify',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            fontFamily: 'BadScript',
            color: Colors.white,
            fontSize: 24.sp,
          ),
        ),
      ),
    );
  }
}
