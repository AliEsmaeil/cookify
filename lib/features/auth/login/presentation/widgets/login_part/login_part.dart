import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/app_dom_colors/app_colors.dart';
import 'package:wagba/core/theme/theme.dart';
import 'package:wagba/reusable_widgets/custom_text_field.dart';
import 'package:wagba/reusable_widgets/identity_providers.dart';
import 'package:wagba/reusable_widgets/auth_redirection.dart';
import 'package:wagba/features/auth/signup/presentation/pages/sign_up_screen.dart';


class AuthScreenLoginPart extends StatelessWidget {
  const AuthScreenLoginPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Signing You In' ,
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
                onPressed: (){},
                child: Text('Login'),
              ),

             AuthRedirection(
                  redirectText: 'Don\'t Have an Account' ,
                  redirectButtonText: 'Sign up',
                  callBack: ()=> Navigator.of(context).pushNamed(SignUpScreen.routeName),
              ),

              IdentityProviders(),
            ],
          ),
        ),
      ),
    );
  }
}
