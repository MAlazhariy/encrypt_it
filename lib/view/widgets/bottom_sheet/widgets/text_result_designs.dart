// ignore_for_file: deprecated_member_use

import 'package:encryption_app/controllers/app_cubit/cubit.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class TextResultFilterWidget extends StatelessWidget {
  const TextResultFilterWidget(this.isEncrypt, {Key? key}) : super(key: key);

  final bool isEncrypt;

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    final int linesInResultText =
        cubit.textResult.length - cubit.textResult.replaceAll('\n', '').length;
    final bool isResultLarge = (!isEncrypt &&
        (cubit.textResult.length >= 100 || linesInResultText >= 3));

    if (isResultLarge) {
      cubit.setCurrentFieldToNoneAndInactivated();
      return const LargeResultWidget();
    } else if (isEncrypt) {
      return const EncryptedResultWidget();
    } else {
      return const DecryptedResultWidget();
    }
  }
}

class EncryptedResultWidget extends StatelessWidget {
  const EncryptedResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return Padding(
      padding: EdgeInsets.only(
        // bottom: 18+5,
        right: 18+5,
        left: 18+5,
      ),
      child: Text(
        cubit.textResult,
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: encryptedTextColor,
          fontSize: 16+5,
          fontWeight: FontWeight.normal,
          fontFamily: 'Baloo',
        ),
      ),
    );
  }
}

class DecryptedResultWidget extends StatelessWidget {
  const DecryptedResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return Padding(
      padding: EdgeInsets.only(
        right: 18+5,
        left: 18+5,
      ),
      child: SelectableAutoLinkText(
        cubit.textResult,
        style: TextStyle(
          color: decryptedTextColor,
          fontSize: 16+5,
          fontWeight: FontWeight.normal,
          fontFamily: 'Baloo',
        ),
        textAlign: TextAlign.center,
        linkStyle: const TextStyle(
          color: linkColor,
          decoration: TextDecoration.underline,
          fontStyle: FontStyle.italic,
        ),
        highlightedLinkStyle: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: mainColor,
          fontWeight: FontWeight.normal,
        ),
        onTap: (String url) {
          launchUrl(
            Uri.parse(url),
          );
        },
      ),
    );
  }
}

class LargeResultWidget extends StatelessWidget {
  const LargeResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 22+5,
          ),
          child: SelectableAutoLinkText(
            cubit.textResult,
            style: TextStyle(
              color: decryptedTextColor,
              fontSize: 16+5,
              fontWeight: FontWeight.normal,
              fontFamily: 'Baloo',
            ),
            textAlign: TextAlign.center,
            linkStyle: const TextStyle(
              color: linkColor,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
            ),
            highlightedLinkStyle: const TextStyle(
              color: Colors.white,
              backgroundColor: mainColor,
              fontWeight: FontWeight.normal,
            ),
            onTap: (String url) {
              launchUrl(
                Uri.parse(url),
              );
            },
          ),
        ),
      ),
    );
  }
}
