import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wagba/core/constants/app_assets.dart';
import 'package:wagba/core/constants/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int chosenIndex;
  final void Function(int)? onTap;
  const BottomNavBar({super.key, required this.chosenIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      onTap: onTap,
      color: AppColors.orangeColor,
      height: 70.h,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: Colors.orange,
      animationCurve: Curves.decelerate,
      index: chosenIndex,
      items: [
        SvgPicture.asset(
          AppAssets.homeNav,
          width: 25.w,
          height: 25.w,
          colorFilter: chosenIndex == 0
              ? ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn)
              : null,
        ),
        SvgPicture.asset(
          AppAssets.basketNav,
          width: 25.w,
          height: 25.w,
          colorFilter: chosenIndex == 1
              ? ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn)
              : null,
        ),
        SvgPicture.asset(
          AppAssets.heartNav,
          width: 25.w,
          height: 25.w,
          colorFilter: chosenIndex == 2
              ? ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn)
              : null,
        ),
        SvgPicture.asset(
          AppAssets.gearNav,
          width: 25.w,
          height: 25.w,
          colorFilter: chosenIndex == 3
              ? ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn)
              : null,
        ),
      ],
    );
  }
}
