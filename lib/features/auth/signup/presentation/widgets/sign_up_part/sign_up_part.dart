import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/core/theme/theme.dart';
import 'package:wagba/features/auth/login/presentation/pages/auth_screen.dart';
import 'package:wagba/reusable_widgets/auth_redirection.dart';
import 'package:wagba/reusable_widgets/custom_text_field.dart';

class SignUpPart extends StatelessWidget {
  const SignUpPart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        flex :3,
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Text(
                  'Signing Up' ,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontFamily: 'BadScript',
                    color: AppColors.orangeColor,
                    fontWeight: FontWeight.w700,
                  ),),
                SizedBox(height: 8.h,),

                CustomTextField(
                  hintText: 'Email',
                  inputAction: TextInputAction.next,
                  prefixIconPath: 'assets/icons/email.svg',
                  controller: TextEditingController(),
                  textInputType: TextInputType.emailAddress,
                ),

                SizedBox(height: 20.h,),
                CustomTextField(
                  hintText: 'Password',
                  inputAction: TextInputAction.next,
                  prefixIconPath: 'assets/icons/password.svg',
                  controller: TextEditingController(),
                  textInputType: TextInputType.emailAddress,
                  secureText: true,
                ),
                SizedBox(height: 20.h,),

                FilledButton(
                  onPressed: (){

                  },
                  child: Text('Sign up'),
                ),

                AuthRedirection(
                    redirectText: 'Already Have an Account',
                    redirectButtonText: 'Log in',
                    callBack: ()=>Navigator.of(context).pushNamed(AuthScreen.routeName),
                ),
              ],
            ),
          )
        ),
    );
  }
}
