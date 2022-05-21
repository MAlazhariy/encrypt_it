import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/cubit/app_cubit/cubit.dart';
import 'package:encryption_app/modules/ads/interstitial_ad_bottomsheet_model.dart';
import 'package:encryption_app/decoding/decoding.dart';
import 'package:encryption_app/modules/bottom_sheet/bottom_sheet_bottuns.dart';
import 'package:encryption_app/shared/components/components/alert_dialog/decoding_alerts.dart';
import 'package:encryption_app/modules/bottom_sheet/text_result_widgets.dart';
import 'package:encryption_app/shared/components/components/dismiss_keyboard.dart';
import 'package:encryption_app/shared/components/components/rate_app.dart';
import 'package:encryption_app/shared/network/local/operation_counter_cache.dart';
import 'package:encryption_app/shared/network/local/rate_app_cache.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Function onPressMainButton({
  @required AppCubit cubit,
  @required BuildContext context,
  @required bool isEncrypt,
  @required String msg,
  @required String pass,
  @required GlobalKey<ScaffoldState> scaffoldKey,
}) {
  if (cubit.isButtonsActive) {
    return () {
      // increase operations counter
      OperationCounterCache.increaseCounter();

      /// load an interstitial ad
      AdInterstitialBottomSheet.loadInterstitialAd();

      cubit.setCurrentFieldToNone();
      dismissKeyboard(context);

      // decoding the text & set result in cubit
      // to show in bottom sheet
      cubit.setTextResult(
        Decoding().decoder(msg, pass, context, isEncrypt),
      );

      bottomSheetFilter(
          cubit, context, isEncrypt, msg, pass, scaffoldKey
      );
    };
  }

  return null;
}

void bottomSheetFilter(
    AppCubit cubit,
    BuildContext context,
    bool isEncrypt,
    String msg,
    String pass,
    GlobalKey<ScaffoldState> scaffoldKey,
    ) {
  // decrypt cases
  final bool incorrectPassword = (cubit.textResult == 'invalid password'.tr());
  final bool versionNotFound = (cubit.textResult == 'version_not_found'.tr());
  final bool laterVersion = (cubit.textResult == 'later_version_warning_title'.tr());

  if(incorrectPassword){
    incorrectPasswordAlert(context);
  }
  else if(versionNotFound) {
    versionNotFoundAlert(context);
  }
  else if (laterVersion) {
    laterVersionAlert(context);
  }
  else {
    openBottomSheet(cubit, isEncrypt, pass, scaffoldKey, context);
  }
}


void openBottomSheet(
    AppCubit cubit,
    bool isEncrypt,
    String pass,
    GlobalKey<ScaffoldState> scaffoldKey,
    BuildContext context,
    ) {
      scaffoldKey.currentState.showBottomSheet((context){
          return BottomSheetWidget(
            cubit,
            isEncrypt,
            pass,
          );
        },
      ).closed.then((_) async {
        _onCloseBottomSheet(cubit,context);
      });
}


class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget( this.cubit, this.isEncrypt, this.password, {Key key}) : super(key: key);

  final AppCubit cubit;
  final bool isEncrypt;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.sp),
        ),
        color: contrastColor,
        boxShadow: const [
          BoxShadow(
            color: shadowColor,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // small dash
          SizedBox(height: 13.sp,),
          Container(
            width: 10.w,
            height: 3.7.sp,
            decoration: BoxDecoration(
              color: lightGrayColor.withAlpha(85),
              borderRadius: BorderRadius.circular(50),
            ),
          ),

          // action title ['encrypt' or 'decrypt']
          SizedBox(height: 9.5.sp,),
          Text(
            isEncrypt ? 'encrypted text'.tr() + ' :' : 'decrypted message'.tr() + ' :',
            style: TextStyle(
              color: lightGrayColor,
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
            ),
          ),

          // text result widget
          SizedBox(height: 4.5.sp,),
          TextResultFilterWidget(cubit, isEncrypt),

          // bottom buttons
          SizedBox(height: 12.sp,),
          BottomSheetButtons(cubit.textResult, password, isEncrypt,),
        ],
      ),
    );
  }
}


void _onCloseBottomSheet(
    AppCubit cubit,
    BuildContext context,
    ) async {

  cubit.setCurrentFieldToNone();

  // show rating application if available
  bool readyShowInAppRate = RateCache.isReadyShowRate(inAppReview: true);
  if(readyShowInAppRate){
    await showInAppRate();
  } else if(RateCache.isReadyShowRate()){
    showRateDialog(context);
  } else {
    // show ad
    AdInterstitialBottomSheet.showInterstitialAd();
  }

}


