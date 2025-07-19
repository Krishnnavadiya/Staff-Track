import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/constant/app_image.dart';
import 'package:hrms/src/model/on_boading_model.dart';
import 'package:hrms/src/router/router.dart';
import 'package:hrms/src/storage/app_storage.dart';
import 'package:hrms/src/utils/utils.dart';
import 'package:hrms/src/widget/app_elevated_button.dart';
import 'package:hrms/src/widget/app_text.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:sizer/sizer.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final List<OnBoardingModel> data = [
    OnBoardingModel(
      image: AppImage.onBoardingImage1,
      title: 'Welcome to HR Payroll',
      description:
          'A payroll system in HR management refers to the process and software used by businesses to manage the compensation of their employees',
    ),
    OnBoardingModel(
      image: AppImage.onBoardingImage2,
      title: 'Easy Attendance System',
      description: 'The attendance management system should be easy to use',
    ),
    OnBoardingModel(
      image: AppImage.onBoardingImage3,
      title: 'Optimize Workers',
      description:
          'HR Management made easily,organize your daily working routine easily',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: OnBoardingBuilder(
            data: data,
            onComplete: () async {
              await AppStorage.setIsOnBoardingComplete(true);
              Get.offAllNamed(Routes.signIn);
            },
          ),
        ),
      ),
    );
  }
}

class OnBoardingBuilder extends StatefulWidget {
  final List<OnBoardingModel> data;
  final OnSubmit onComplete;
  const OnBoardingBuilder({
    super.key,
    required this.data,
    required this.onComplete,
  });

  @override
  State<OnBoardingBuilder> createState() => _OnBoardingBuilderState();
}

class _OnBoardingBuilderState extends State<OnBoardingBuilder> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.data.isNotEmpty, 'Data is not empty');
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.data.length,
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            itemBuilder: (context, index) {
              OnBoardingModel model = widget.data[index];
              return Column(
                children: [
                  const Spacer(),
                  Image.asset(
                    model.image,
                    width: 80.w,
                  ),
                  const Spacer(),
                  AppText(
                    model.title,
                    fontSize: 19.sp,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  GapH(2.h),
                  AppText(
                    model.description,
                    fontSize: 13.5.sp,
                  ),
                  const Spacer(),
                ],
              );
            },
          ),
        ),
        GapH(10.h),
        Row(
          children: [
            Expanded(
              child: Row(
                children: List.generate(widget.data.length, (index) {
                  return AnimatedContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    height: 15,
                    width: index == pageIndex ? 45 : 15,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    duration: const Duration(milliseconds: 200),
                  );
                }),
              ),
            ),
            AppElevatedButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              text:
                  pageIndex != widget.data.length - 1 ? 'Next' : 'Get Started',
              onPressed: () {
                if (pageIndex != widget.data.length - 1) {
                  pageController.animateToPage(
                    pageIndex + 1,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                } else {
                  widget.onComplete();
                }
              },
            ),
          ],
        ),
        GapH(5.h),
      ],
    );
  }
}
