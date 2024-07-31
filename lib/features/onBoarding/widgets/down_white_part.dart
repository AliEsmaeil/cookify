import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/app_dom_colors/app_colors.dart';

class DownWhitePart extends StatelessWidget {
  const DownWhitePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Get The Freshest Meal From Us',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.mainTextColor,
                        ),
                    softWrap: false,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Text(
                        'We deliver the best and freshest meals. Order a one today!!!',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.greyTextColor,
                            )),
                  ),
                ],
              ),
              FilledButton(
                  onPressed: () {},
                  child: Text(
                    'Let\'s Continue',
                  )),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ));
  }
}
