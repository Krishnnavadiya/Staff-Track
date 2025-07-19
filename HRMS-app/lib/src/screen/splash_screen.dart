import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_image.dart';
import 'package:hrms/src/router/router.dart';
import 'package:hrms/src/storage/app_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = Tween(begin: 0.0, end: 250.0).animate(animationController);
    animationController.forward();
    goToNext();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Image.asset(
              AppImage.logo,
              height: animation.value,
            );
          },
        ),
      ),
    );
  }

  void goToNext() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!AppStorage.getIsOnBoardingComplete) {
        Get.offAllNamed(Routes.onBoarding);
        return;
      }
      if (AppStorage.getToken == null) {
        Get.offAllNamed(Routes.signIn);
        return;
      }
      Get.offAllNamed(Routes.home);
    });
  }
}
