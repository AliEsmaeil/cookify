import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_assets.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/core/utils/field_vaildator.dart';
import 'package:wagba/features/auth/login/presentation/manager/auth_cubit/login_cubit.dart';
import 'package:wagba/features/home/presentation/pages/home_screen.dart';
import 'package:wagba/reusable_widgets/custom_text_field.dart';
import 'package:wagba/reusable_widgets/custom_toast.dart';
import 'package:wagba/reusable_widgets/identity_providers.dart';
import 'package:wagba/reusable_widgets/auth_redirection.dart';
import 'package:wagba/features/auth/signup/presentation/pages/sign_up_screen.dart';

import '../../manager/auth_cubit/login_states.dart';

class AuthScreenLoginPart extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  AuthScreenLoginPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginScreenStates>(
      listener: (context, state) {

        if(state is LoginScreenLoginFailureState){
          showToast(message: state.failure.message, color: AppColors.toastFailureColor);
        }
        if(state is LoginScreenSuccessLoginState){

          Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false, arguments: state.userCredential);
        }
      },
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'Signing You In',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontFamily: 'BadScript',
                            color: AppColors.orangeColor,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextField(
                      hintText: 'Email',
                      inputAction: TextInputAction.next,
                      prefixIconPath: AppAssets.emailIcon,
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      validator: FieldValidator.emailValidator,
                      // onChanged: (s){
                      //   emailController.text = s??'';
                      // },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      inputAction: TextInputAction.done,
                      prefixIconPath: AppAssets.passwordIcon,
                      suffixIconPath: BlocProvider.of<LoginCubit>(context).isPasswordVisible ?
                      AppAssets.eyeSlashIcon : AppAssets.eyeIcon,
                      controller: passwordController,
                      textInputType: TextInputType.emailAddress,
                      secureText: ! BlocProvider.of<LoginCubit>(context).isPasswordVisible,
                      validator: FieldValidator.passwordValidator,
                      onSuffixPressed: ()=>BlocProvider.of<LoginCubit>(context).togglePasswordVisibility(),
                      // onChanged: (s){
                      //   passwordController.text = s??'';
                      // },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    FilledButton(
                      onPressed: () {
                       validateAndCall(context: context);
                      },
                      child: Text('Login'),
                    ),
                    AuthRedirection(
                      redirectText: 'Don\'t Have an Account',
                      redirectButtonText: 'Sign up',
                      callBack: () =>
                          Navigator.of(context).pushNamed(SignUpScreen.routeName),
                    ),
                    IdentityProviders(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void validateAndCall({required BuildContext context}){
print('email : ${emailController.text}');
print('password : ${passwordController.text}');

    if(formKey.currentState!.validate()){
      BlocProvider.of<LoginCubit>(context)
          .signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);
    }
  }
}
