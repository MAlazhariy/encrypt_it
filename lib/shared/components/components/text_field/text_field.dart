import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.theKey,
    required this.controller,
    this.isPassword = false,
    required this.onChange,
    this.validator,
    this.showShadow = true,
    this.onTab,
    this.hintText,
    this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.isEnabled,
  }) : super(key: key);

  final GlobalKey<FormState> theKey;
  final TextEditingController controller;
  final bool isPassword;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final void Function()? onTab;
  final String? hintText;
  final String? labelText;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isEnabled;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
        boxShadow: [
          if(showShadow)
            const BoxShadow(
              color: shadowColor,
              blurRadius: 15,
              offset: Offset(0,6),
            ),
        ],
      ),

      child: Form(
        key: theKey,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: TextInputType.multiline,
          maxLines: isPassword ? 1 : 9,
          minLines: 1,
          scrollPhysics: const BouncingScrollPhysics(),
          autofocus: false,
          enabled: isEnabled,
          onChanged: onChange,
          validator: validator,
          onTap: onTab,

          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 15.sp,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefixIconConstraints: BoxConstraints(
              minHeight: 30.sp,
              minWidth: 34.sp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.sp),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.sp),
              borderSide: const BorderSide(
                color: redColor,
                width: 2.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: const BorderSide(
                color: redColor,
                width: 3,
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            errorMaxLines: 3,
            errorStyle: TextStyle(
              color: contrastColor,
              fontSize: 9.3.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
