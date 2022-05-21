import 'package:encryption_app/shared/components/components/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/dialog_buttons.dart';
import 'package:encryption_app/shared/components/components/menu/menu_item.dart';
import 'package:encryption_app/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportABugMenuItem extends StatelessWidget {
  const ReportABugMenuItem(this.appVersion,{Key key}) : super(key: key);

  final String appVersion;

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'report_bug'.tr(),
      icon: Icons.assistant_outlined,
      onTap: (){
        showCustomDialog(
          context: context,
          title: 'report_bug'.tr(),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Center(
                  child: Icon(
                    Icons.assistant_outlined,
                    size: 80.sp,
                    color: Colors.grey[300],
                  ),
                ),
                width: double.infinity,
              ),
              SizedBox(height: 15.sp,),
              Text(
                'report_bug_description'.tr(),
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
                await launch(Links.mailUs(
                  subject: 'report_bug'.tr() + ' - ' + appVersion,
                )).then((value) {
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
