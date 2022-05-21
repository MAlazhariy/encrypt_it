import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:encryption_app/shared/styles/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class MainButton extends StatelessWidget {
  const MainButton({
    required this.onPressed,
    required this.isEncrypt,
    Key? key
  }) : super(key: key);

  final void Function()? onPressed;
  final bool isEncrypt;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,

      disabledColor: mainColor,
      disabledTextColor: contrastColor.withAlpha(50),

      color: contrastColor,
      textColor: isEncrypt ? encryptedTextColor : decryptedTextColor,
      // textColor: mainColor,

      splashColor: isEncrypt ? encryptedTextColor.withAlpha(40) : decryptedTextColor.withAlpha(40),
      highlightColor: bGColor.withAlpha(40),

      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.sp, vertical: 4.sp,),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 20.sp,
              child: Icon(
                isEncrypt ? MyIcons.lock_stars : MyIcons.unlock_stars,
                // size: 19.sp,
              ),
            ),
            SizedBox(
              width: 6.5.sp,
            ),
            Text(
              isEncrypt ? 'encrypt'.tr() : 'decrypt'.tr(),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



