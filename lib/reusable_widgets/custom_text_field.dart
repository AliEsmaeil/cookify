import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wagba/core/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  final bool isForTabs;
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
  // to reuse this text field for search in home screen
  final VoidCallback? onTap;
  final Color? fillColor;
  final TextStyle? hintTextStyle;

  const CustomTextField(
      {super.key,
        this.isForTabs = false,
      this.suffixIconPath,
        this.onTap,
        this.fillColor,
        this.hintTextStyle,
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
      onTap: onTap,
      onFieldSubmitted: onSubmitted,
      controller: controller,
      textInputAction: inputAction,
      keyboardType: textInputType,
      obscureText: secureText,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintTextStyle,
          fillColor: fillColor,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: prefixIconPath.contains('.svg')? SvgPicture.asset(
              prefixIconPath,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ):
                Image.asset(prefixIconPath),
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

          // TODO: CHANGE ENABLED AND DISABLED BORDERS FOR TABS TO DEAL WITH THEME
          enabledBorder: isForTabs ? OutlineInputBorder(
    borderRadius: BorderRadius.circular(25.r),
    borderSide: BorderSide(color: Color(0xFFF3F1F1), width: 1),
    ): Theme.of(context).inputDecorationTheme.enabledBorder,

        focusedBorder: isForTabs ? OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.r),
      borderSide: BorderSide(color: Color(0xFFF3F1F1), width: 1),
    ): Theme.of(context).inputDecorationTheme.enabledBorder,

    ),
      style: AppTheme.textFieldTextStyle,
      validator: validator,
    );
  }
}
