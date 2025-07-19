import 'package:flutter/material.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/utils/utils.dart';
import 'package:sizer/sizer.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final OnSubmit onPressed;
  final Color buttonColor;
  final double height;
  final double elevation;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  const AppElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonColor = AppColor.primaryColor,
    this.height = 55.0,
    this.elevation = 3,
    this.borderRadius,
    this.textStyle,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      color: buttonColor,
      child: InkWell(
        highlightColor: AppColor.transparent,
        splashColor: AppColor.buttonSplashColor,
        onTap: onPressed,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: padding,
          height: height,
          alignment: Alignment.center,
          child: Text(
            text,
            style: textStyle ??
                TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  letterSpacing: 1,
                ),
          ),
        ),
      ),
    );
  }
}
