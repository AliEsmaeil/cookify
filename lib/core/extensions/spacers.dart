import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Spacers on num{

  // return the value of the current number but using screen util extension h, to be responsive
  SizedBox get verticalSpacer=>SizedBox(height: h,);

  SizedBox get horizontalSpacer=>SizedBox(width : w,);

  SizedBox get boxSpacer=>SizedBox.square(dimension: r,);
}