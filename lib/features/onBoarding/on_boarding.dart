import 'package:flutter/material.dart';
import 'package:wagba/core/app_dom_colors/app_colors.dart';
import 'package:wagba/features/onBoarding/widgets/bottom_white_part.dart';
import 'package:wagba/features/onBoarding/widgets/top_orange_part.dart';

class OnBoardingScreen extends StatelessWidget {

  static const routeName = '/onBoarding';

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:[
            TopOrangePart(),
            BottomWhitePart(),
          ]
        ),
      ),
    );
  }
}
