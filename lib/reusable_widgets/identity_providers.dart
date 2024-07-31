import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IdentityProviders extends StatelessWidget {
  const IdentityProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){},
          child: CircleAvatar(
            radius: 15.w,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: Image.asset('assets/images/identity_providers/google.png'),
          ),
        ),
        SizedBox(width: 25.w,),
        GestureDetector(
          onTap: (){},
          child: CircleAvatar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            radius: 15.w,
            child: Image.asset('assets/images/identity_providers/apple.png'),
          ),
        ),

      ],
    );
  }
}
