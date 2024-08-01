import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_assets.dart';
import 'package:wagba/features/auth/login/presentation/manager/auth_cubit/login_cubit.dart';

class IdentityProviders extends StatelessWidget {
  const IdentityProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            BlocProvider.of<LoginCubit>(context).signInWithGoogle();
          },
          child: CircleAvatar(
            radius: 15.w,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: Image.asset(AppAssets.googleLogo),
          ),
        ),
        SizedBox(width: 25.w,),
        GestureDetector(
          onTap: (){
            BlocProvider.of<LoginCubit>(context).signInWithFacebook();
          },
          child: CircleAvatar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            radius: 15.w,
            child: Image.asset(AppAssets.facebookLogo),
          ),
        ),
        SizedBox(width: 25.w,),
        GestureDetector(
          onTap: (){
           // BlocProvider.of<LoginCubit>(context).signInWithGoogle();
          },
          child: CircleAvatar(
            radius: 15.w,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: Image.asset(AppAssets.appleLogo),
          ),
        ),


      ],
    );
  }
}
