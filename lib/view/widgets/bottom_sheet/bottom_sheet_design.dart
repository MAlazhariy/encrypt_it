import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/controllers/app_cubit/cubit.dart';
import 'package:encryption_app/view/widgets/bottom_sheet/widgets/bottom_sheet_buttons.dart';
import 'package:encryption_app/view/widgets/bottom_sheet/widgets/text_result_designs.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomSheetDesign extends StatelessWidget {
  const BottomSheetDesign(this.isEncrypt, this.password, {Key? key})
      : super(key: key);

  final bool isEncrypt;
  final String password;

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.sp),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor(context),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 13.sp),

          // small dash
          Container(
            width: 10.w,
            height: 3.7.sp,
            decoration: BoxDecoration(
              color: iconsGrayColor.withAlpha(85),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(height: 9.sp),

          // action title ['encrypt' or 'decrypt']
          Text(
            isEncrypt
                ? '${'encrypted text'.tr()} :'
                : '${'decrypted message'.tr()} :',
            style: TextStyle(
              color: titlesColor(context),
              fontWeight: FontWeight.w400,
              fontSize: 9.sp,
            ),
          ),
          SizedBox(height: 4.5.sp),

          // text result widget
          TextResultFilterWidget(isEncrypt),
          // SizedBox(height: 4.sp),

          // bottom buttons
          BottomSheetButtons(
            cubit.textResult,
            password,
            isEncrypt,
          ),
        ],
      ),
    );
  }
}
