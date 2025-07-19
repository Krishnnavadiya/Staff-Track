import 'package:flutter/material.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:sizer/sizer.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;

  const AppText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.fontStyle = FontStyle.normal,
    this.color,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
            color: color ?? AppColor.black,
            fontSize: fontSize ?? 14.sp,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            overflow: overflow,
          ),
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
      strutStyle: strutStyle,
      textAlign: textAlign ?? TextAlign.center,
      textDirection: TextDirection.ltr,
      textHeightBehavior: textHeightBehavior,
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
    );
  }
}
