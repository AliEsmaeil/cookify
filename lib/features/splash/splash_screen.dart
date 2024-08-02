import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/onBoarding/on_boarding.dart';
import 'package:wagba/features/splash/widgets/meal_hub_container.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delayThenGo();
  }
  void delayThenGo()async{
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context).pushNamedAndRemoveUntil(
        OnBoardingScreen.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: context.width/2,
              child: Image.asset(
                'assets/images/Lime.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10.h,),
            const MealHubContainer(),
          ],
        ),
      ),
    );
  }
}
