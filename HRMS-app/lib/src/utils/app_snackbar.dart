import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';

class AppSnackbar {
  static void showErrorSnackbar({
    String? title,
    String? message,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: AppColor.red.withAlpha(210),
        margin: const EdgeInsets.all(16),
        barBlur: 20,
        title: title ?? 'Error',
        message: message,
        duration: const Duration(seconds: 2),
        borderRadius: 10,
      ),
    );
  }

  static void showSuccessSnackbar({
    String? title,
    String? message,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: AppColor.green.withAlpha(210),
        margin: const EdgeInsets.all(16),
        barBlur: 20,
        title: title ?? 'Success',
        message: message,
        duration: const Duration(seconds: 2),
        borderRadius: 10,
      ),
    );
  }

  static void showInfoSnackbar({
    String? title,
    String? message,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: AppColor.blueGrey.withAlpha(210),
        margin: const EdgeInsets.all(16),
        barBlur: 20,
        title: title ?? 'Info',
        message: message,
        duration: const Duration(seconds: 2),
        borderRadius: 10,
      ),
    );
  }
}
