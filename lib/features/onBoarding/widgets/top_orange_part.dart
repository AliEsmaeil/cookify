import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/app_dom_colors/app_colors.dart';
import 'package:wagba/reusable_widgets/under_shadow_image.dart';

class TopOrangePart extends StatelessWidget {
  const TopOrangePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.orangeColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                    child: Image.asset('assets/images/fruitDrop.png', width: 50.w , height: 37.52.h,)),
                Image.asset(
                  'assets/images/fruitBasket1.png',
                  width: 375.w,
                  height: 260.h,
                ),
          
               const UnderShadowImage(),
              ],
            ),
          ),
        )
    );
  }
}
