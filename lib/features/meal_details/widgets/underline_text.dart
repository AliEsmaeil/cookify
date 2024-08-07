import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';

class UnderlineText extends StatelessWidget {
  final String title;
  const UnderlineText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 4.r, color: AppColors.orangeColor)),
        borderRadius: BorderRadius.circular(5.r),
      ),
    );
  }
}
