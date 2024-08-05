import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_assets.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/features/auth/login/presentation/pages/auth_screen.dart';
import 'package:wagba/features/auth/signup/presentation/manager/sign_up_cubit.dart';
import 'package:wagba/features/home/home_presentation/pages/home_screen.dart';
import 'package:wagba/reusable_widgets/auth_redirection.dart';
import 'package:wagba/reusable_widgets/custom_text_field.dart';
import 'package:wagba/reusable_widgets/custom_toast.dart';
import 'package:wagba/reusable_widgets/password_evaluator_show.dart';

class SignUpPart extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  SignUpPart({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SignUpCubit, SignUpStates>(
  listener: (context, state) {
    if(state is SignUpFailedSignUpState){
      showToast(message: state.failure.message, color: AppColors.toastFailureColor);
    }
    else if (state is SignUpSuccessfulSignUpState){
      // TODO: SHOW SUCCESS SCREEN
      Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false, arguments: state.userCredential);
    }
  },
  builder: (context, state) {
    return Expanded(
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
                  prefixIconPath: AppAssets.emailIcon,
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                ),

                SizedBox(height: 20.h,),
                CustomTextField(
                  hintText: 'Password',
                  inputAction: TextInputAction.done,
                  prefixIconPath: AppAssets.passwordIcon,
                  suffixIconPath:  BlocProvider.of<SignUpCubit>(context).isPasswordVisible? AppAssets.eyeSlashIcon:
                  AppAssets.eyeIcon,
                  onSuffixPressed: ()=> BlocProvider.of<SignUpCubit>(context).togglePasswordVisibility(),
                  controller: passwordController,
                  textInputType: TextInputType.visiblePassword,
                  secureText: !BlocProvider.of<SignUpCubit>(context).isPasswordVisible,
                  onChanged: (s)=>BlocProvider.of<SignUpCubit>(context).assessPasswordStrength(password: s ?? ''),
                ),

                if(state is SignUpChangePasswordStrengthState)
                  PasswordEvaluatorShow(strength: state.strength),


                SizedBox(height: 15.h,),
                FilledButton(
                  onPressed: (){
                    BlocProvider.of<SignUpCubit>(context).signUp(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  },
                  child: state is SignUpLoadingState? const CircularProgressIndicator() : Text('Sign up'),
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
  },
);
  }
}
