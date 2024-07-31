import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {

  static const routeName = 'onBoarding';

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Welcome Screen'),
      ),
    );
  }
}
