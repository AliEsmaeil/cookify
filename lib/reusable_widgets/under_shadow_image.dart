import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnderShadowImage extends StatelessWidget {
  const UnderShadowImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height : 10.h),
        Image.asset('assets/images/underShadow.png', width: 301.w, height: 12.h,),
        SizedBox(height: 50.h,),
      ],
    );
  }
}
