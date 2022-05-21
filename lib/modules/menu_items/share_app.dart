import 'package:clipboard/clipboard.dart';
import 'package:encryption_app/decoding/decoding.dart';
import 'package:encryption_app/shared/components/components/menu/menu_item.dart';
import 'package:encryption_app/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:share_plus/share_plus.dart';

class ShareAppMenuItem extends StatelessWidget {
  const ShareAppMenuItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'share_app'.tr(),
      icon: Icons.share,
      onTap: (){
        String _welcomePassword = '123';
        String _encryptedWelcomeText = Decoding().decoder('welcome_text'.tr(), _welcomePassword, context, true);
        String _shareMessage = 'share_app_message'.tr(namedArgs: {'encrypted_text': _encryptedWelcomeText, 'password': _welcomePassword});

        // FlutterClipboard.copy(_shareMessage);
        FlutterClipboard.copy(Links.appOnGooglePlay);

        Share.share(
          _shareMessage,
          subject: 'Encrypt it',
        );
      },
    );
  }
}
