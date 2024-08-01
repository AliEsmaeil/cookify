import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wagba/core/constants/app_colors.dart';

void showToast({required String message, Color color = AppColors.toastSuccessColor}) {

 // The following commented code reuires context to work

  // FToast fToast = FToast();
  //
  // Widget toast = Container(
  //   padding:  EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 12.0.h),
  //   decoration: BoxDecoration(
  //     borderRadius: BorderRadius.circular(25.0.r),
  //     color: color,
  //   ),
  //   child: Text(message)
  // );
  //
  // fToast.showToast(
  //   child: toast,
  //   gravity: ToastGravity.BOTTOM,
  //   toastDuration: Duration(seconds: 2),
  //   fadeDuration: Duration(milliseconds: 500),
  //   isDismissable: true,
  // );

  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0.sp,
  );

}