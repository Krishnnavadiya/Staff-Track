import 'package:flutter/material.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:sizer/sizer.dart';

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final BorderRadius? borderRadius;
  final double height;
  final TextStyle? style;
  final Color buttonColor;

  const AppOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius,
    this.height = 55,
    this.style,
    this.buttonColor = AppColor.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.transparent,
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      child: InkWell(
        splashColor: buttonColor.withOpacity(0.20),
        highlightColor: buttonColor.withOpacity(0.05),
        onTap: onPressed,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
            border: Border.all(
              width: 2,
              color: buttonColor,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: style ??
                  TextStyle(
                    fontSize: 13.sp,
                    color: buttonColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
