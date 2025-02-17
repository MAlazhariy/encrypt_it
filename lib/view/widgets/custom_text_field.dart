import 'package:encryption_app/view/widgets/my_directionality.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.theKey,
    required this.controller,
    this.isPassword = false,
    required this.onChange,
    this.validator,
    this.validate = true,
    this.onTab,
    this.hintText,
    this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.isEnabled,
  });

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
  final bool validate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: shadowColor(context, lightAlpha: 155),
            offset: const Offset(3, 3),
            blurRadius: 4,
            spreadRadius: 1,
            inset: true,
          ),
          BoxShadow(
            color: highLightColor(context),
            offset: const Offset(-0.8, -2.5),
            blurRadius: 4,
            spreadRadius: 0.6,
            inset: true,
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
            fontFamily: 'Baloo',
            fontSize: 15+5,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            suffixIcon: suffixIcon,
            prefixIcon: MyDirectionality(child: prefixIcon),
            prefixIconConstraints: BoxConstraints(
              minHeight: 35,
              minWidth: 60,
            ),
            // contentPadding: const EdgeInsets.symmetric(
            //   horizontal: 150,
            //   vertical: 15,
            // ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                color: validate ? Colors.transparent : redColor,
                width: 2.5,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                color: validate ? Colors.transparent : redColor,
                width: 2.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                color: validate ? Colors.transparent : redColor,
                width: 2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(
                color: redColor,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(
                color: redColor,
                width: 2.5,
              ),
            ),
            fillColor: Colors.white,
            filled: false,
            errorMaxLines: null,
            errorStyle: const TextStyle(
              height: 0,
              color: Colors.transparent,
              fontSize: 0,
              // fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
