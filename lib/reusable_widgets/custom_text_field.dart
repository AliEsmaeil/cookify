import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wagba/core/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String?)? onSubmitted;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction inputAction;
  final TextCapitalization capitalization;
  final String prefixIconPath;
  final TextInputType textInputType;
  final String hintText;
  final bool secureText;
  final String? suffixIconPath;
  final VoidCallback? onSuffixPressed;

  const CustomTextField(
      {super.key,
      this.suffixIconPath,
        this.onSuffixPressed,
      this.secureText = false,
      required this.hintText,
      this.validator,
      required this.controller,
      this.onSubmitted,
      this.onChanged,
      required this.inputAction,
      this.capitalization = TextCapitalization.none,
      required this.prefixIconPath,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: capitalization,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      controller: controller,
      textInputAction: inputAction,
      keyboardType: textInputType,
      obscureText: secureText,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SvgPicture.asset(
              prefixIconPath,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            maxWidth: 38.w,
            maxHeight: 38.w,
          ),
          suffixIcon: (suffixIconPath == null)
              ? null
              : IconButton(
            onPressed: onSuffixPressed,
                icon: SvgPicture.asset(
                    suffixIconPath!,
                    colorFilter:
                        const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
              ),
        suffixIconConstraints:  BoxConstraints(
          maxWidth: 38.w,
          maxHeight: 38.w,
        ),
      ),
      style: AppTheme.textFieldTextStyle,
      validator: validator,
    );
  }
}
