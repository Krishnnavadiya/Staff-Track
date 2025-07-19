import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hrms/src/constant/app_color.dart';

class AppLoading {
  static void setUpLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..indicatorWidget =
          const CircularProgressIndicator(color: AppColor.white)
      ..loadingStyle = EasyLoadingStyle.custom
      ..maskType = EasyLoadingMaskType.custom
      ..indicatorSize = 50.0
      ..radius = 10.0
      ..backgroundColor = AppColor.transparent
      ..boxShadow = <BoxShadow>[]
      ..indicatorColor = AppColor.primaryColor
      ..textColor = AppColor.primaryColor
      ..maskColor = AppColor.black.withAlpha(150)
      ..contentPadding = const EdgeInsets.all(20)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  static void showLoading() {
    EasyLoading.show();
  }

  static void hideLoading() {
    EasyLoading.dismiss();
  }
}
