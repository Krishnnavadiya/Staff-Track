import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/constant/app_image.dart';
import 'package:hrms/src/controller/authentication_service.dart';
import 'package:hrms/src/screen/network_screen.dart';
import 'package:hrms/src/widget/app_elevated_button.dart';
import 'package:hrms/src/widget/app_text.dart';
import 'package:hrms/src/widget/app_text_formfield.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:sizer/sizer.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NetworkScreen(child: ResetScreenView());
  }
}

class ResetScreenView extends StatefulWidget {
  const ResetScreenView({super.key});

  @override
  State<ResetScreenView> createState() => _ResetScreenViewState();
}

class _ResetScreenViewState extends State<ResetScreenView> {
  final authenticationService = Get.find<AuthenticationService>();

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();

  bool currentObscureText = true;
  bool newObscureText = true;
  bool confirmObscureText = true;

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
        title: const AppText(
          'Reset Password',
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 25,
            color: AppColor.primaryColor,
          ),
        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  Image.asset(
                    AppImage.newPassword,
                    width: 70.w,
                  ),
                  GapH(2.h),
                  const AppText(
                    'Create your new password, keeping mind and remember it.',
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  GapH(2.h),
                  AppTextFormField(
                    obscureText: currentObscureText,
                    controller: currentPasswordController,
                    hintText: 'Enter current password',
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(Icons.lock),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.trim().contains(' ')) {
                        return 'Enter valid password';
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentObscureText = !currentObscureText;
                        });
                      },
                      child: Icon(
                        currentObscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  GapH(2.h),
                  AppTextFormField(
                    obscureText: newObscureText,
                    controller: newPasswordController,
                    hintText: 'Enter new password',
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(Icons.lock),
                    validator: (value) {
                      if (value == null) {
                        return 'Password is required';
                      } else if (value.trim().length < 8) {
                        return 'Password length must be greater than 8';
                      } else if (value.trim().contains(' ')) {
                        return 'Enter valid password';
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          newObscureText = !newObscureText;
                        });
                      },
                      child: Icon(
                        newObscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  GapH(2.h),
                  AppTextFormField(
                    obscureText: confirmObscureText,
                    controller: confirmPasswordController,
                    hintText: 'Enter confirm password',
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(Icons.lock),
                    validator: (value) {
                      if (value != newPasswordController.text) {
                        return 'password don\'t match';
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          confirmObscureText = !confirmObscureText;
                        });
                      },
                      child: Icon(
                        confirmObscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  GapH(2.h),
                  AppElevatedButton(
                    text: 'Reset Password',
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        authenticationService.changePassword(
                          password: currentPasswordController.text.trim(),
                          newPassword: newPasswordController.text.trim(),
                        );
                      }
                    },
                  ),
                  GapH(2.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
