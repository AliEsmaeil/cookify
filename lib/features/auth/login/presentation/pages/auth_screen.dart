import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/features/auth/login/presentation/manager/auth_cubit/login_cubit.dart';
import 'package:wagba/features/auth/login/presentation/widgets/login_part/login_part.dart';
import 'package:wagba/features/auth/login/presentation/widgets/top_orange_part.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AuthScreenTopOrangePart(),
              AuthScreenLoginPart(),
            ],
          ),
        ),
      ),
    );
  }
}
