import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/reusable_widgets/under_shadow_image.dart';

class AuthScreenTopOrangePart extends StatelessWidget {
  const AuthScreenTopOrangePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: AppColors.orangeColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/fruitBasket2.png', width: 301.w, height: 281.2.h,),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset('assets/images/fruitDrop.png', width: 50.w, height: 37.5.h,),
                  ),
            
                ],
              ),
            
              const UnderShadowImage(),
            ],
          ),
        ),
      )
    );
  }
}
