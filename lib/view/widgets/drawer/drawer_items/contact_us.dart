import 'package:encryption_app/view/widgets/drawer/drawer_item.dart';
import 'package:encryption_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsMenuItem extends StatelessWidget {
  const ContactUsMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'contact_us'.tr(),
      icon: Icons.email_outlined,
      onTap: () async {
        Navigator.pop(context);
        await launchUrl(
          Links.mailUs(subject: 'contact_us'.tr()),
        );
        // await launchUrl(
        //   Links.facebookPage,
        //   mode: LaunchMode.externalNonBrowserApplication,
        // );
      },
    );
  }
}
