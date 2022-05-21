import 'package:clipboard/clipboard.dart';
import 'package:encryption_app/modules/add_to_text_store.dart';
import 'package:encryption_app/shared/components/components/custom_showcase.dart';
import 'package:encryption_app/shared/components/components/custom_toast.dart';
import 'package:encryption_app/shared/network/local/showcase_cache.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class BottomSheetButtons extends StatelessWidget {
  const BottomSheetButtons(this.textResult, this.password, this.isEncrypt,
      {Key? key})
      : super(key: key);

  final String textResult;
  final String password;
  final bool isEncrypt;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        CustomDivider(isEncrypt),
        AddToStoreButton(isEncrypt, textResult),
        CopyButton(textResult, password, isEncrypt),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider(this.isEncrypt, {Key? key}) : super(key: key);
  final bool isEncrypt;

  @override
  Widget build(BuildContext context) {
    if (isEncrypt) {
      return const Divider(
        thickness: 2,
        height: 0,
        color: Color(0xFFE0E0E0),
      );
    }
    return Container();
  }
}

class AddToStoreButton extends StatelessWidget {
  AddToStoreButton(this.isEncrypt, this.textResult, {Key? key})
      : super(key: key);

  final bool isEncrypt;
  final String textResult;

  final GlobalKey _addToTextStoreShowcase = GlobalKey();

  void _showAddToTextStoreCase(BuildContext context) {
    if (!ShowCaseCache.isAddTextStoreShowCaseViewed()) {
      WidgetsBinding.instance.addPostFrameCallback((_) => Future.delayed(
            const Duration(milliseconds: 500),
            () => ShowCaseWidget.of(context)?.startShowCase([
              _addToTextStoreShowcase,
            ]),
          ));

      ShowCaseCache.addTextStoreShowCaseViewed();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isEncrypt) {
      _showAddToTextStoreCase(context);

      return CustomShowcase(
        globalKey: _addToTextStoreShowcase,
        title: 'add_to_storage'.tr(),
        description: 'showcase_add_to_store_description'.tr(),
        child: MaterialButton(
          elevation: 0,
          highlightElevation: 0,
          focusElevation: 0,
          disabledElevation: 0,
          hoverElevation: 0,
          height: 39.sp,
          color: mainColor.withAlpha(30),
          textColor: mainColor,
          onPressed: () {
            AddToTextStore().add(context, textResult);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.enhanced_encryption,
                size: 16.5.sp,
              ),
              SizedBox(
                width: 3.sp,
              ),
              Text(
                'add_to_storage'.tr(),
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}

class CopyButton extends StatelessWidget {
  const CopyButton(this.textResult, this.password, this.isEncrypt, {Key? key})
      : super(key: key);

  final String textResult;
  final String password;
  final bool isEncrypt;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      disabledElevation: 0,
      hoverElevation: 0,
      height: 39.sp,
      color: isEncrypt ? mainColor : mainColor,

      // copy text & show toast
      onPressed: () {
        FlutterClipboard.copy(textResult);
        Navigator.pop(context);

        showToast(
          title: 'msg copied'.tr(),
          textColor: mainColor,
          contentFillColor: contrastColor,
        );
      },

      // copy all & show toast
      onLongPress: () {
        if (isEncrypt) {
          FlutterClipboard.copy(
              'Ciphertext: "$textResult"\nPassword: "$password"');

          Navigator.pop(context);

          showToast(
            title: 'all copied'.tr(),
            textColor: contrastColor,
            contentFillColor: mainColor,
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.copy_rounded,
            color: Colors.white,
            size: 16.5.sp,
          ),
          SizedBox(
            width: 1.sp,
          ),
          Text(
            'copy'.tr(),
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
