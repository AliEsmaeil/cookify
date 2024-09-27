import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/core/constants/app_visual_properties.dart';

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
        shape:WidgetStatePropertyAll( RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        elevation: WidgetStatePropertyAll(0),
        backgroundColor: WidgetStatePropertyAll(AppColors.orangeColor),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 56.h)),
        textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 20.sp, color: AppColors.whiteColor, fontWeight: FontWeight.w500 , fontFamily: 'Brandon')),
        surfaceTintColor: WidgetStatePropertyAll(AppColors.orangeColor),
        foregroundColor: WidgetStatePropertyAll(AppColors.whiteColor),
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
        surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStatePropertyAll(Colors.blue.shade600),
        textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: 'Brandon')),
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        elevation: WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r))),
        overlayColor: WidgetStatePropertyAll(AppColors.orangeColor.withAlpha(30)),
      ),
    ),

    tabBarTheme: TabBarTheme(
      overlayColor: WidgetStatePropertyAll(AppColors.orangeColor.withOpacity(.2)),
      tabAlignment: TabAlignment.start,
      indicatorSize: TabBarIndicatorSize.label,
      indicator:UnderlineTabIndicator(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 5.r , color: AppColors.orangeColor),
        insets: EdgeInsets.only(right: 65.r),
      ),
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.black,
      dividerColor: Colors.transparent,
      dividerHeight: 0,
      indicatorColor: AppColors.orangeColor,
      labelPadding: EdgeInsets.only(left: 0, right: 25.r),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        fontFamily: 'Brandon',
        color: Colors.black,
        overflow: TextOverflow.fade,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'Brandon',
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    ),

    // may not be used, because curved Nav Bar is used
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
       selectedIconTheme: IconThemeData(
         color: Colors.deepOrange,
       ),

      elevation: 2,
      selectedItemColor: AppColors.orangeColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),

    // appBarTheme: AppBarTheme(
    //   backgroundColor: AppColors.orangeColor,
    //   surfaceTintColor:  AppColors.orangeColor,
    //   foregroundColor: AppColors.whiteColor,
    //   ),
    dividerTheme: DividerThemeData(
      color: Colors.grey.shade200,
      thickness: 2,
    ),
    cardTheme: CardTheme(
      elevation: 10,
      shadowColor: Colors.black38,
      color: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.w),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
    ),
    listTileTheme: ListTileThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      style: ListTileStyle.list,
      contentPadding: EdgeInsets.all(AppVisualProperties.defaultPadding),
      subtitleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 13,
      ),
      tileColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
        overflow: TextOverflow.clip,
      ),
      leadingAndTrailingTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 13,
      ),
      selectedColor: Colors.grey.shade300,

    )


  );
}