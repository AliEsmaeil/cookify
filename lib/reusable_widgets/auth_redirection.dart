import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthRedirection extends StatelessWidget {

  final String redirectText;
  final String redirectButtonText;
  final VoidCallback callBack;

  const AuthRedirection({super.key  ,required this.redirectText, required this.redirectButtonText , required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(redirectText,
        style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(width: 10.w,),
        TextButton(
          onPressed: callBack,
          child: Text(redirectButtonText),
        ),
      ],
    );
  }
}
