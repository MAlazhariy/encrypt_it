// ignore_for_file: unused_import

import 'package:clipboard/clipboard.dart';
import 'package:encryption_app/decoding/decoding.dart';
import 'package:encryption_app/shared/components/components/menu/menu_item.dart';
import 'package:encryption_app/shared/components/constants.dart';
import 'package:encryption_app/shared/styles/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:share_plus/share_plus.dart';

class ShareAppMenuItem extends StatelessWidget {
  const ShareAppMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'share_app'.tr(),
      icon: MyIcons.share,
      onTap: (){
        final shareMessage = 'share_app_message'.tr(namedArgs: {'appLink': Links.appOnGooglePlay.toString()});
        FlutterClipboard.copy(shareMessage);

        Share.share(
          shareMessage,
          subject: 'What is Encrypt it?',
        );
      },
    );
  }
}
