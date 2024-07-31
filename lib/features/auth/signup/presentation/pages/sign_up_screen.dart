import 'package:flutter/material.dart';
import 'package:wagba/features/auth/signup/presentation/widgets/sign_up_part/sign_up_part.dart';
import 'package:wagba/features/onBoarding/widgets/top_orange_part.dart';

class SignUpScreen extends StatelessWidget {

  static const routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopOrangePart(),
            SignUpPart(),
          ],
        )
      )
    );
  }
}
