import 'package:encryption_app/controllers/app_cubit/cubit.dart';
import 'package:encryption_app/view/widgets/custom_dialog/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/view/widgets/custom_dialog/dialog_button.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_item.dart';
import 'package:encryption_app/utils/constants.dart';
import 'package:encryption_app/network/local/operation_counter_cache.dart';
import 'package:encryption_app/view/widgets/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportABugMenuItem extends StatelessWidget {
  const ReportABugMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    final String appVersion = AppCubit.get(context).appInfo.version;

    return MenuItemWidget(
      title: 'report_bug'.tr(),
      icon: MyIcons.report_flag,
      // icon: Icons.assistant_outlined,
      onTap: () {
        showCustomDialog(
          context: context,
          title: 'report_bug'.tr(),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Icon(
                    Icons.assistant_outlined,
                    size: 80+5,
                    color: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(
                height: 15+5,
              ),
              Text(
                'report_bug_description'.tr(),
                style: TextStyle(
                  fontSize: 12+5,
                ),
              ),
            ],
          ),
          buttons: [
            DialogButton(
                title: 'back'.tr(),
                onPressed: () {
                  Navigator.pop(context);
                }),
            DialogButton(
              title: 'contact_us'.tr(),
              onPressed: () async {
                await launchUrl(
                  Links.mailUs(
                    subject:
                        '${'report_bug'.tr()} - $appVersion - ${OperationCounterCache.getCounter()}',
                  ),
                ).then((value) {
                  Navigator.pop(context);
                });
              },
              isBold: true,
            ),
          ],
        );
      },
    );
  }
}
