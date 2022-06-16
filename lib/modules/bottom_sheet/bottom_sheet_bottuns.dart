import 'package:clipboard/clipboard.dart';
import 'package:encryption_app/modules/add_to_text_store/add_to_text_store_screen.dart';
import 'package:encryption_app/shared/components/components/custom_showcase.dart';
import 'package:encryption_app/shared/components/components/custom_toast.dart';
import 'package:encryption_app/shared/components/components/small_button.dart';
import 'package:encryption_app/shared/network/local/showcase_cache.dart';
import 'package:encryption_app/shared/styles/my_icons_icons.dart';
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
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsetsDirectional.only(bottom: 5),
      width: double.maxFinite,
      alignment: AlignmentDirectional.center,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 10.sp,
        children: [
          // copy
          SmallButton(
            title: 'copy'.tr(),
            onPressed: () {
              copy(
                text: textResult,
                context: context,
              );
            },
            onLongPress: isEncrypt
                ? () {
                    copyAll(
                      text: textResult,
                      password: password,
                      context: context,
                    );
                  }
                : null,
            icon: MyIcons.copy,
          ),
          // add to store
          if (isEncrypt) AddToStoreButton(isEncrypt, textResult),
        ],
      ),
    );
  }
}

class AddToStoreButton extends StatelessWidget {
  AddToStoreButton(this.isEncrypt, this.textResult, {Key? key})
      : super(key: key);

  final bool isEncrypt;
  final String textResult;
  final GlobalKey _addToTextStoreShowcase = GlobalKey();

  void _showCase(BuildContext context) {
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
    _showCase(context);

    return CustomShowcase(
      globalKey: _addToTextStoreShowcase,
      title: 'add_to_storage'.tr(),
      description: 'showcase_add_to_store_description'.tr(),
      child: SmallButton(
        title: 'add_to_storage'.tr(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddToTextStoreScreen(encryptedText: textResult),
            ),
          );
        },
        icon: MyIcons.bookmark_add,
      ),
    );
  }
}

void copyAll({
  required String text,
  required String password,
  required BuildContext context,
}) {
  FlutterClipboard.copy('Ciphertext: "$text"\nPassword: "$password"');

  Navigator.pop(context);

  showToast(
    title: 'all copied'.tr(),
    context: context,
    contrast: true,
  );
}

void copy({
  required String text,
  required BuildContext context,
}) {
  FlutterClipboard.copy(text);
  // Navigator.pop(context);

  showToast(
    title: 'msg copied'.tr(),
    context: context,
  );
}
