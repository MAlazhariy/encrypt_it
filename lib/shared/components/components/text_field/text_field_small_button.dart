import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



class TextFieldQuickActions extends StatelessWidget {
  const TextFieldQuickActions({
    @required this.title,
    @required this.onPressed,
    @required this.icon,
    this.onLongPress,
    Key key,
  }) : super(key: key);
  final Function onPressed;
  final Function onLongPress;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 2.3.sp,
        horizontal: 3.5.sp,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        color: smallButtonsColor,
        splashColor: mainColor.withAlpha(50),
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: _ButtonDesign(icon, title),
      ),
    );
  }
}



class _ButtonDesign extends StatelessWidget {
  const _ButtonDesign(
      this.icon,
      this.title,
      {Key key}
      ) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.9.sp,
        vertical: 2.3.sp,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: buttonsTitleColor,
            size: 13.sp,
          ),
          SizedBox(
            width: 3.sp,
          ),
          Text(
            title,
            style: TextStyle(
              color: buttonsTitleColor,
              fontSize: 9.75.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
