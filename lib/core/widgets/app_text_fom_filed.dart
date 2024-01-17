import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;

  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Function(String?)? onChanged;
  const AppTextFormField({
    this.prefixIcon,
    this.keyboardType,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.green,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(7.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black12,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(7.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: hintStyle ?? TextStyles.font16weight600,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      obscureText: isObscureText ?? false,
      onChanged: (value){
        return onChanged!(value);
      },
      validator: (value) {
        return validator(value);
      },
    );
  }
}
//TextFormField(
//                     controller: controllerName,
//                     keyboardType: TextInputType.name,
//                     decoration: InputDecoration(
//                       isDense: true,
//                       enabledBorder: OutlineInputBorder(
//                         borderSide:  BorderSide(
//                           color: Colors.black12,
//                           width: 1.3,
//                         ),
//                       ),
//
//                         hintText: 'قم بادخال الاسم',
//                       helperStyle: TextStyles.font14weight500,
//
//                       prefixIcon: Image.asset('assets/icons/solar_user-linear.png'),
//                         border: OutlineInputBorder(
//
//                             borderRadius: BorderRadius.circular(7),
//
//                         ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                           color: Colors.green,
//                           width: 1.3,
//                         ),
//                         borderRadius: BorderRadius.circular(7.0),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                           color: Colors.red,
//                           width: 1.3,
//                         ),
//                         borderRadius: BorderRadius.circular(16.0),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                           color: Colors.red,
//                           width: 1.3,
//                         ),
//                         borderRadius: BorderRadius.circular(16.0),
//                       ),),
//                   )