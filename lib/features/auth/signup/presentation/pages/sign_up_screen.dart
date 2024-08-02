import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/features/auth/signup/presentation/manager/sign_up_cubit.dart';
import 'package:wagba/features/auth/signup/presentation/widgets/sign_up_part/sign_up_part.dart';
import 'package:wagba/features/onBoarding/widgets/top_orange_part.dart';

class SignUpScreen extends StatelessWidget {

  static const routeName = '/signup';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
          body: SafeArea(
              child: Column(
                children: [
                  TopOrangePart(),
                  SignUpPart(),
                ],
              )
          )
      ),
    );
  }
}
