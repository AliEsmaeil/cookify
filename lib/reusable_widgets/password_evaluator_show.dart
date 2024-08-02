import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/extensions/context_extension.dart';

class PasswordEvaluatorShow extends StatelessWidget {
  final int strength;

  const PasswordEvaluatorShow({super.key, required this.strength});

  @override
  Widget build(BuildContext context) {
    Color mainColor = (strength == 1)? Colors.redAccent : (strength == 2) ? Colors.orangeAccent : Colors.green;

    return Padding(
      padding:  EdgeInsets.symmetric(vertical : 10.h),
      child: SizedBox(
        height: 40.h,
        child: Row(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Strength:'),
            Expanded(
              flex: strength,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 12.5.h),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(),
                   gradient: LinearGradient(
                     begin: Alignment.centerLeft,
                     end: Alignment.centerRight,

                     colors: <Color>[
                       mainColor.withOpacity(0.4),
                       mainColor.withOpacity(0.75),
                       mainColor,
                     ],
                   ) ,
                    // shadows: <BoxShadow>[
                    //   BoxShadow(
                    //     color: mainColor.withBlue(200),
                    //     blurRadius: 2,
                    //     spreadRadius: 2,
                    //   ),
                    // ]
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3-strength,
              child: const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
