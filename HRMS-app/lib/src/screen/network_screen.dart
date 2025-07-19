import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/constant/app_image.dart';
import 'package:hrms/src/controller/network_service.dart';
import 'package:sizer/sizer.dart';

class NetworkScreen extends StatelessWidget {
  final Widget child;
  const NetworkScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final NetworkService controller = Get.find<NetworkService>();
    return Obx(() {
      if (controller.isNetworkAvailable.value) {
        return child;
      }
      return Scaffold(
        backgroundColor: AppColor.scaffoldBackgroundColor,
        body: Center(
          child: Image.asset(
            AppImage.noInternet,
            width: 80.w,
          ),
        ),
      );
    });
  }
}
