import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';

class UnderlineText extends StatelessWidget {
  final String title;
  const UnderlineText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            decorationThickness: 3.h,
            decorationStyle: TextDecorationStyle.wavy,
            decorationColor: AppColors.orangeColor,
            decoration: TextDecoration.underline,
            color: Colors.transparent,
            shadows: [
              Shadow(
                offset: Offset(0,-7),
              ),
            ]
          ),
        ),
        5.verticalSpace,

        // Container(
        //   height: 5.h,
        //   decoration: BoxDecoration(
        //     color: AppColors.orangeColor,
        //     borderRadius: BorderRadius.circular(5.r),
        //   ),
        // )
      ],
    );
  }
}
