import 'package:encryption_app/cubit/app_cubit/cubit.dart';
import 'package:encryption_app/shared/components/components/custom_dialogs/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialogs/dialog_button.dart';
import 'package:encryption_app/shared/components/components/menu/menu_item.dart';
import 'package:encryption_app/shared/components/constants.dart';
import 'package:encryption_app/shared/network/local/operation_counter_cache.dart';
import 'package:encryption_app/shared/styles/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportABugMenuItem extends StatelessWidget {
  const ReportABugMenuItem({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final String appVersion = AppCubit.get(context).appInfo.version;

    return MenuItemWidget(
      title: 'report_bug'.tr(),
      icon: MyIcons.report_flag,
      // icon: Icons.assistant_outlined,
      onTap: (){
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
                    size: 80.sp,
                    color: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(height: 15.sp,),
              Text(
                'report_bug_description'.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          buttons: [
            DialogButton(
                title: 'back'.tr(),
                onPressed: (){
                  Navigator.pop(context);
                }
            ),
            DialogButton(
              title: 'contact_us'.tr(),
              onPressed: () async {
                await launchUrl(
                  Links.mailUs(
                    subject: '${'report_bug'.tr()} - $appVersion - ${OperationCounterCache.getCounter()}',
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
