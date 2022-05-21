// ignore_for_file: deprecated_member_use

import 'package:encryption_app/cubit/app_cubit/cubit.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class TextResultFilterWidget extends StatelessWidget {
  const TextResultFilterWidget(this.cubit, this.isEncrypt, {Key? key}) : super(key: key);

  final AppCubit cubit;
  final bool isEncrypt;

  @override
  Widget build(BuildContext context) {
    final int linesInResultText = cubit.textResult.length - cubit.textResult.replaceAll('\n', '').length;
    final bool isResultLarge = (!isEncrypt && (cubit.textResult.length >= 100 || linesInResultText >= 3));

    if (isResultLarge) {
      cubit.setCurrentFieldToNoneAndInactivated();
      return LargeResultWidget(cubit);
    }
    else if (isEncrypt) {
      return EncryptedResultWidget(cubit);
    }
    else {
      return DecryptedResultWidget(cubit);
    }
  }
}


class EncryptedResultWidget extends StatelessWidget {
  const EncryptedResultWidget(this.cubit, {Key? key}) : super(key: key);


  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        // bottom: 18.sp,
        right: 18.sp,
        left: 18.sp,
      ),
      child: Text(
        cubit.textResult,
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: encryptedTextColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Cairo',
        ),
      ),
    );
  }
}

class DecryptedResultWidget extends StatelessWidget {
  const DecryptedResultWidget(this.cubit, {Key? key}) : super(key: key);

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 18.sp,
        left: 18.sp,
      ),
      child: SelectableAutoLinkText(
        cubit.textResult,
        style: TextStyle(
          color: decryptedTextColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Cairo',
        ),
        textAlign: TextAlign.center,
        linkStyle: const TextStyle(
          color: linkColor,
          decoration: TextDecoration.underline,
          fontStyle: FontStyle.italic,
        ),
        highlightedLinkStyle: const TextStyle(
          color: contrastColor,
          backgroundColor: mainColor,
          fontWeight: FontWeight.w700,
        ),
        onTap: (url) {
          launch(url, forceSafariVC: false);
        },
      ),
    );
  }
}
class LargeResultWidget extends StatelessWidget {
  const LargeResultWidget(this.cubit, {Key? key}) : super(key: key);

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 22.sp,
          ),
          child: SelectableAutoLinkText(
            cubit.textResult,
            style: TextStyle(
              color: decryptedTextColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Cairo',
            ),
            textAlign: TextAlign.center,
            linkStyle: const TextStyle(
              color: linkColor,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
            ),
            highlightedLinkStyle: const TextStyle(
              color: contrastColor,
              backgroundColor: mainColor,
              fontWeight: FontWeight.w700,
            ),
            onTap: (url) {
              launch(url, forceSafariVC: false);
            },
          ),
        ),
      ),
    );
  }
}