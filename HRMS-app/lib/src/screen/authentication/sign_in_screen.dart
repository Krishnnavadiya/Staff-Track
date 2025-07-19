import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/constant/app_image.dart';
import 'package:hrms/src/controller/authentication_service.dart';
import 'package:hrms/src/widget/app_elevated_button.dart';
import 'package:hrms/src/widget/app_text_formfield.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInView();
  }
}

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  bool obscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  AuthenticationService authController = Get.find<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Form(
              key: _form,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GapH(5.h),
                    Image.asset(
                      AppImage.logo,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                    GapH(2.h),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GapH(6.h),
                    AppTextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null) {
                          return 'Email is required';
                        } else if (!EmailValidator.validate(value.trim())) {
                          return 'Enter valid email';
                        }
                        return null;
                      },
                      hintText: 'Enter email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.mail),
                    ),
                    GapH(2.h),
                    AppTextFormField(
                      obscureText: obscureText,
                      controller: passwordController,
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
                      hintText: 'Enter password',
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                    GapH(2.h),
                    AppElevatedButton(
                      text: 'Sign In',
                      onPressed: () {
                        if (_form.currentState!.validate()) {
                          authController.signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
