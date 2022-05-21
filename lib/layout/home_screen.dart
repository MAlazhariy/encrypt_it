import 'package:bot_toast/bot_toast.dart';
import 'package:clipboard/clipboard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/cubit/app_cubit/cubit.dart';
import 'package:encryption_app/cubit/app_cubit/states.dart';
import 'package:encryption_app/decoding/versions/version_06.dart';
import 'package:encryption_app/modules/bio_local_authentication.dart';
import 'package:encryption_app/modules/ads/banner_ad_model.dart';
import 'package:encryption_app/modules/bottom_sheet/bottom_sheet.dart';
import 'package:encryption_app/modules/edit_text_store_screen.dart';
import 'package:encryption_app/modules/my_app_drawer.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/dialog_buttons.dart';
import 'package:encryption_app/shared/components/components/custom_showcase.dart';
import 'package:encryption_app/shared/components/components/custom_toast.dart';
import 'package:encryption_app/shared/components/components/dismiss_keyboard.dart';
import 'package:encryption_app/shared/components/components/main_buttons.dart';
import 'package:encryption_app/shared/components/components/text_field/text_field_small_button.dart';
import 'package:encryption_app/shared/components/components/text_field/text_field.dart';
import 'package:encryption_app/shared/network/local/showcase_cache.dart';
import 'package:encryption_app/shared/network/local/text_store_cache.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:encryption_app/shared/styles/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sizer/sizer.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class HomeScreen extends StatelessWidget {
  var textKey = GlobalKey<FormState>();
  var passKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool passValidate = true;

  TextEditingController messageCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  final GlobalKey _textFieldShowcase = GlobalKey();
  final GlobalKey _passwordFieldShowcase = GlobalKey();
  final GlobalKey _encryptButtonShowcase = GlobalKey();
  final GlobalKey _decryptButtonShowcase = GlobalKey();

  final GlobalKey _textStoreShowcase = GlobalKey();
  final GlobalKey _pasteShowcase = GlobalKey();
  final GlobalKey _clearShowcase = GlobalKey();
  final GlobalKey _clearAllShowcase = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      autoPlay: false,
      autoPlayDelay: const Duration(
        seconds: 5,
      ),
      builder: Builder(
        builder: (_) => BlocProvider(
          create: (context) => AppCubit(),
          child: BlocConsumer<AppCubit, AppStates>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              AppCubit cubit = AppCubit.get(context);

              if (state is AppInitState) {
                cubit.getAppInfo();
              }

              // main showcase
              if (state is AppGetVersionState &&
                  !ShowCaseCache.isMainShowCaseViewed()) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => Future.delayed(
                    const Duration(milliseconds: 100),
                    () => ShowCaseWidget.of(context)?.startShowCase([
                      _textFieldShowcase,
                      _passwordFieldShowcase,
                      _encryptButtonShowcase,
                      _decryptButtonShowcase
                    ]),
                  ),
                );

                ShowCaseCache.mainShowCaseViewed();
              }

              // text field showcase
              if (cubit.isCurrentFieldText &&
                  !ShowCaseCache.isButtonsShowCaseViewed()) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => ShowCaseWidget.of(context)?.startShowCase([
                    _pasteShowcase,
                    _clearShowcase,
                    _clearAllShowcase,
                    _textStoreShowcase,
                  ]),
                );

                ShowCaseCache.buttonsShowCaseViewed();
              }

              // this function activate or deactivate main buttons
              void activeButtons([validate = true]) {
                cubit.setButtonsPressable((messageCtrl.text.isNotEmpty &&
                    passCtrl.text.isNotEmpty &&
                    validate));
              }

              // this fuction paste the text in its field
              // and password in its field at once.
              void pasteAll() {
                FlutterClipboard.paste().then((value){
                  // ensure if value contains ciphertext & password
                  if (value.startsWith('Ciphertext: "') &&
                      value.contains('\nPassword: "')) {
                    /// paste message in its area
                    messageCtrl.text = value.substring(
                        value.indexOf('Ciphertext: "') + 13,
                        value.indexOf('"\nPassword:'));

                    /// paste password in its area
                    passCtrl.text = value.substring(
                        value.indexOf('\nPassword: "') + 12,
                        value.lastIndexOf('"'));

                    activeButtons(passKey.currentState!.validate());

                    /// set cursor to the end of text field
                    messageCtrl.selection = TextSelection.fromPosition(
                        TextPosition(offset: messageCtrl.text.length));

                    /// Show successful toast
                    BotToast.showText(
                      text: 'pasted success'.tr(),
                      duration: const Duration(milliseconds: 800),
                      contentColor: contrastColor,
                      textStyle: const TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                      borderRadius: BorderRadius.circular(12.sp),
                      clickClose: true,
                    );
                  } else {
                    // The copied text does not contain ciphertext & password
                    // Show fail toast
                    BotToast.showText(
                      text: 'fail paste'.tr(),
                      duration: const Duration(seconds: 3),
                      contentColor: mainColor,
                      textStyle: const TextStyle(
                        color: contrastColor,
                        fontWeight: FontWeight.w600,
                      ),
                      borderRadius: BorderRadius.circular(12.sp),
                      clickClose: true,
                    );
                  }
                });
              }

              return Scaffold(
                key: scaffoldKey,
                backgroundColor: bGColor,

                appBar: AppBar(
                  title: Text(
                    cubit.appInfo.appName,
                    style: const TextStyle(
                      // color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  shadowColor: shadowColor,
                  centerTitle: true,
                ),

                drawer: MyAppDrawer(cubit),

                // makes keyboard shown over the bottom sheet
                resizeToAvoidBottomInset: false,

                body: Padding(
                  padding: EdgeInsets.only(
                    right: 6.w,
                    left: 6.w,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(height: 3.h),

                              // text field
                              CustomShowcase(
                                globalKey: _textFieldShowcase,
                                title: 'showcase_text_field_title'.tr(),
                                description:
                                    'showcase_text_field_description'.tr(),
                                child: CustomTextField(
                                  theKey: textKey,
                                  controller: messageCtrl,
                                  hintText: 'msg here'.tr(),
                                  onChange: (value) {
                                    activeButtons(passValidate);
                                  },
                                  prefixIcon: Icon(
                                    MyIcons.text,
                                    size: 16.sp,
                                  ),
                                  onTab: () {
                                    cubit.setCurrentFieldToText();
                                  },
                                  isEnabled:
                                      (!cubit.isCurrentFieldNoneAndInactivated),
                                ),
                              ),
                              if (cubit.isCurrentFieldText)
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    alignment: WrapAlignment.end,
                                    direction: Axis.horizontal,
                                    verticalDirection: VerticalDirection.up,
                                    children: [
                                      /// clear all
                                      CustomShowcase(
                                        globalKey: _clearAllShowcase,
                                        // title: 'clear all'.tr(),
                                        description:
                                            'showcase_clearAll_description'
                                                .tr(),
                                        child: TextFieldQuickActions(
                                            icon: Icons.clear_rounded,
                                            title: 'clear all'.tr(),
                                            onPressed: () {
                                              messageCtrl.text = '';
                                              passCtrl.text = '';

                                              activeButtons(passKey.currentState!
                                                  .validate());
                                              cubit.clearAllFields();

                                              dismissKeyboard(context);
                                            }),
                                      ),

                                      /// clear
                                      CustomShowcase(
                                        globalKey: _clearShowcase,
                                        description:
                                            'showcase_clear_description'.tr(),
                                        // title: 'clear'.tr(),
                                        child: TextFieldQuickActions(
                                          icon: Icons.highlight_remove_outlined,
                                          title: 'clear'.tr(),
                                          onPressed: () {
                                            messageCtrl.text = '';
                                            activeButtons(passValidate);

                                            dismissKeyboard(context);
                                          },
                                        ),
                                      ),

                                      /// paste
                                      CustomShowcase(
                                        globalKey: _pasteShowcase,
                                        // title: 'paste'.tr(),
                                        description:
                                            'showcase_paste_description'.tr(),
                                        child: TextFieldQuickActions(
                                          icon: Icons.paste_outlined,
                                          title: 'paste'.tr(),
                                          // paste in password field on single press
                                          onPressed: () {
                                            FlutterClipboard.paste()
                                                .then((value) {
                                              messageCtrl.text = value;
                                              activeButtons(passKey.currentState!
                                                  .validate());

                                              messageCtrl.selection =
                                                  TextSelection.fromPosition(
                                                      TextPosition(
                                                          offset: messageCtrl
                                                              .text.length));
                                            });
                                          },

                                          // on long press .. paste all
                                          onLongPress: () {
                                            pasteAll();
                                          },
                                        ),
                                      ),

                                      /// text store
                                      CustomShowcase(
                                        globalKey: _textStoreShowcase,
                                        description:
                                            'showcase_text_store_description'
                                                .tr(),
                                        title: 'message_store'.tr(),
                                        child: TextFieldQuickActions(
                                          icon: Icons.enhanced_encryption,
                                          title: 'message_store'.tr(),
                                          onPressed: () async {
                                            Map? groups = TextStoreCache.getGroups();

                                            final bool hasBio = await LocalAuthApi.hasBiometrics();
                                            final isAuthenticated = hasBio
                                                // ? await LocalAuthApi.authenticate()
                                                ? true
                                                : true;

                                            // todo: important handle bio
                                            if(isAuthenticated)  {
                                              showCustomDialog(
                                                context: context,
                                                title: 'choose_message'.tr(),
                                                content: groups?.isNotEmpty ?? false
                                                    ? Column(
                                                        children: List.generate(
                                                          groups!.length,
                                                          // +1 only if want to show AD
                                                          (index) {
                                                            // /// bannerAd
                                                            // if(index==groups.length){
                                                            //   return const AdNative();
                                                            // }

                                                            final String
                                                                groupName =
                                                                groups.keys
                                                                        .toList()[
                                                                    index];
                                                            final Map group =
                                                                groups[
                                                                    groupName];

                                                            // groups
                                                            return ExpansionTile(
                                                              title: Text(
                                                                groupName,
                                                                style:
                                                                    const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              collapsedIconColor:
                                                                  bGColor,
                                                              collapsedTextColor:
                                                                  bGColor,
                                                              iconColor:
                                                                  mainColor,
                                                              textColor:
                                                                  mainColor,
                                                              backgroundColor:
                                                                  mainColor
                                                                      .withAlpha(
                                                                          15),
                                                              children:
                                                                  List.generate(
                                                                      group
                                                                          .length,
                                                                      (index) {
                                                                String title = group
                                                                        .keys
                                                                        .toList()[
                                                                    index];
                                                                String
                                                                    storedEncryptedText =
                                                                    group.values
                                                                            .toList()[
                                                                        index];

                                                                // group titles
                                                                return Container(
                                                                  width: double
                                                                      .infinity,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .symmetric(
                                                                    horizontal:
                                                                        15.sp,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            messageCtrl.text =
                                                                                storedEncryptedText;
                                                                            activeButtons();
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional.centerStart,
                                                                            child:
                                                                                Text(
                                                                              title,
                                                                              style: TextStyle(
                                                                                color: darkGrayColor,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 11.sp,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      // copy
                                                                      IconButton(
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .copy,
                                                                          color:
                                                                              lightGrayColor,
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          FlutterClipboard.copy(
                                                                              storedEncryptedText);

                                                                          showToast(
                                                                            title:
                                                                                'msg copied'.tr(),
                                                                            textColor:
                                                                                contrastColor,
                                                                            contentFillColor:
                                                                                mainColor,
                                                                          );
                                                                        },
                                                                        iconSize:
                                                                            13.sp,
                                                                        color:
                                                                            darkGrayColor,
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.add_box,
                                                            color:
                                                                lightGrayColor,
                                                            size: 50.sp,
                                                          ),
                                                          Text(
                                                            'add_store_message'
                                                                .tr(),
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .grey[500],
                                                              fontSize: 12.sp,
                                                              // height: 0.9.sp,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ],
                                                      ),
                                                buttons: [
                                                  if (groups?.isNotEmpty??false)
                                                    DialogButton(
                                                      title: 'edit'.tr(),
                                                      isBold: false,
                                                      onPressed: () {
                                                        Navigator.pop(context);

                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const EditTextStoreScreen(),
                                                            ));
                                                      },
                                                    ),
                                                  DialogButton(
                                                    title: 'back'.tr(),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              SizedBox(
                                height: 15.sp,
                              ),

                              /// password field
                              CustomShowcase(
                                globalKey: _passwordFieldShowcase,
                                title: 'showcase_password_field_title'.tr(),
                                description:
                                    'showcase_password_field_description'.tr(),
                                child: CustomTextField(
                                  theKey: passKey,
                                  controller: passCtrl,
                                  hintText: 'pass here'.tr(),
                                  validator: (value) {
                                    String undefined =
                                        V06('', passCtrl.text, context, true).getUndefinedChars(value!);
                                    if (undefined.isNotEmpty) {
                                      return 'undefined_chars_title'.tr(args: [undefined]);
                                    }
                                    return null;
                                  },
                                  showShadow: passValidate,
                                  onChange: (value) {
                                    passValidate =
                                        passKey.currentState!.validate();
                                    activeButtons(passValidate);
                                  },
                                  prefixIcon: Icon(
                                    MyIcons.key_lock,
                                    size: 16.sp,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.showAndHidePassword();
                                    },
                                    icon: Icon(
                                      cubit.passwordIcon,
                                      size: 19.sp,
                                    ),
                                  ),
                                  isPassword: true,
                                  obscureText: cubit.isPasswordHidden,
                                  onTab: () {
                                    cubit.setCurrentFieldToPassword();
                                  },
                                  isEnabled:
                                      (!cubit.isCurrentFieldNoneAndInactivated),
                                ),
                              ),
                              if (cubit.isCurrentFieldPassword)
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    alignment: WrapAlignment.end,
                                    direction: Axis.horizontal,
                                    verticalDirection: VerticalDirection.up,
                                    children: [
                                      /// clear all
                                      TextFieldQuickActions(
                                        onPressed: () {
                                          messageCtrl.text = '';
                                          passCtrl.text = '';

                                          activeButtons(
                                              passKey.currentState!.validate());
                                          cubit.clearAllFields();

                                          dismissKeyboard(context);
                                        },
                                        icon: Icons.clear_rounded,
                                        title: 'clear all'.tr(),
                                      ),

                                      /// clear text field
                                      TextFieldQuickActions(
                                        icon: Icons.highlight_remove_outlined,
                                        title: 'clear'.tr(),
                                        onPressed: () {
                                          passCtrl.text = '';
                                          activeButtons(
                                              passKey.currentState!.validate());

                                          dismissKeyboard(context);
                                        },
                                      ),

                                      /// paste
                                      TextFieldQuickActions(
                                        icon: Icons.paste_outlined,
                                        title: 'paste'.tr(),
                                        // paste in text field on single press
                                        onPressed: () {
                                          FlutterClipboard.paste()
                                              .then((value) {
                                            passCtrl.text = value;
                                            activeButtons(passKey.currentState!
                                                .validate());

                                            passCtrl.selection =
                                                TextSelection.fromPosition(
                                                    TextPosition(
                                                        offset: passCtrl
                                                            .text.length));
                                          });
                                        },

                                        // on long press .. paste all
                                        onLongPress: () {
                                          pasteAll();
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                              SizedBox(
                                height: 4.h,
                              ),

                              /// Encrypt & Decrypt buttons
                              Wrap(
                                alignment: WrapAlignment.center,
                                direction: Axis.horizontal,
                                spacing: 8.sp,
                                runSpacing: 9.sp,
                                children: [
                                  // encrypt
                                  CustomShowcase(
                                    globalKey: _encryptButtonShowcase,
                                    description:
                                        'showcase_encrypt_button_description'
                                            .tr(),
                                    child: SizedBox(
                                      child: MainButton(
                                        onPressed: onPressMainButton(
                                          cubit: cubit,
                                          context: context,
                                          msg: messageCtrl.text,
                                          pass: passCtrl.text,
                                          scaffoldKey: scaffoldKey,
                                          isEncrypt: true,
                                        ),
                                        isEncrypt: true,
                                      ),
                                    ),
                                  ),

                                  /// decrypt
                                  CustomShowcase(
                                    globalKey: _decryptButtonShowcase,
                                    description:
                                        'showcase_decrypt_button_description'
                                            .tr(),
                                    child: SizedBox(
                                      child: MainButton(
                                        onPressed: onPressMainButton(
                                          cubit: cubit,
                                          context: context,
                                          msg: messageCtrl.text,
                                          pass: passCtrl.text,
                                          scaffoldKey: scaffoldKey,
                                          isEncrypt: false,
                                        ),
                                        isEncrypt: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const AdBanner(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
