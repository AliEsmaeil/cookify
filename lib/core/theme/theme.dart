import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/app_dom_colors/app_colors.dart';

final class AppTheme{

  static final lightTheme =  ThemeData(
    fontFamily: 'Brandon',
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.whiteColor,

    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 14.sp,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
      ),
      bodyLarge: TextStyle(
        fontSize: 20.sp,
      ),

      titleSmall: TextStyle(
        fontSize: 24.sp,
      ),
      titleMedium: TextStyle(
        fontSize: 32.sp,
      ),

    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape:MaterialStatePropertyAll( RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        elevation: MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(AppColors.orangeColor),
        minimumSize: MaterialStatePropertyAll(Size(double.infinity, 56.h)),
        textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 16.sp, color: AppColors.whiteColor, fontWeight: FontWeight.w500 ,)),
        surfaceTintColor: MaterialStatePropertyAll(AppColors.orangeColor),
        foregroundColor: MaterialStatePropertyAll(AppColors.whiteColor),
        alignment: Alignment.center,

      )
    )


  );
}