import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';

final class AppTheme{

  static const textFieldTextStyle =  TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: Colors.black,
  );

  static final lightTheme =  ThemeData(
    fontFamily: 'Brandon',
    visualDensity: VisualDensity.adaptivePlatformDensity,

    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.whiteColor,

    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 14.sp,
        fontFamily: 'Brandon',
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
          fontFamily: 'Brandon',
      ),
      bodyLarge: TextStyle(
        fontSize: 20.sp,
          fontFamily: 'Brandon',
      ),


      titleSmall: TextStyle(
        fontSize: 24.sp,
          fontFamily: 'Brandon',
      ),
      titleMedium: TextStyle(
        fontSize: 32.sp,
          fontFamily: 'Brandon',
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
        textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 20.sp, color: AppColors.whiteColor, fontWeight: FontWeight.w500 , fontFamily: 'Brandon')),
        surfaceTintColor: MaterialStatePropertyAll(AppColors.orangeColor),
        foregroundColor: MaterialStatePropertyAll(AppColors.whiteColor),
        alignment: Alignment.center,
      ),
    ),


    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF3F1F1),
      hintStyle: TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontWeight: FontWeight.w300,
      ),
      hintFadeDuration: const Duration(milliseconds: 300),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Color(0xFFF3F1F1), width: 1),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: Color(0xD34FADE8), width: 1),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(color: Colors.red.shade300, width: 1),
      ),
      errorMaxLines: 1,
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.red.shade300, width: 1),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
        foregroundColor: MaterialStatePropertyAll(Colors.blue.shade600),
        textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: 'Brandon')),
        backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        elevation: MaterialStatePropertyAll(0),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r))),
        overlayColor: MaterialStatePropertyAll(AppColors.orangeColor.withAlpha(30)),
      ),
    ),


  );
}