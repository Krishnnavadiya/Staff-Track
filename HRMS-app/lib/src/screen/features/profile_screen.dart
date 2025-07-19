import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/constant/app_image.dart';
import 'package:hrms/src/controller/authentication_service.dart';
import 'package:hrms/src/router/router.dart';
import 'package:hrms/src/screen/network_screen.dart';
import 'package:hrms/src/widget/app_network_image.dart';
import 'package:hrms/src/widget/app_text.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NetworkScreen(
      child: ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final authenticationService = Get.find<AuthenticationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
        title: const AppText(
          'Profile',
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: Column(
              children: [
                GapH(2.h),
                Row(
                  children: [
                    GapW(5.5.w),
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20.w),
                      child: SizedBox(
                        height: 20.w,
                        width: 20.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.w),
                          child: authenticationService.user.value.profilePic !=
                                      null &&
                                  authenticationService.user.value.profilePic !=
                                      ''
                              ? AppNetworkImage(
                                  imageUrl: authenticationService
                                      .user.value.profilePic!,
                                )
                              : Center(
                                  child: Icon(
                                    Icons.person,
                                    size: 30.sp,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    GapW(3.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            '${authenticationService.user.value.firstName ?? ''} ${authenticationService.user.value.lastName ?? ''}',
                            fontSize: 12.sp,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          AppText(
                            authenticationService.user.value.email ?? '',
                            fontSize: 12.sp,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w500,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    GapW(2.w),
                  ],
                ),
              ],
            ),
          ),
          GapH(1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Material(
              elevation: 1,
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                splashColor: AppColor.primaryColor.withOpacity(0.10),
                highlightColor: AppColor.transparent,
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.userInformation);
                },
                child: SizedBox(
                  height: 6.h,
                  child: Row(
                    children: [
                      GapW(2.w),
                      Image.asset(
                        AppImage.profile,
                        height: 4.5.h,
                      ),
                      GapW(2.w),
                      Expanded(
                        child: AppText(
                          'Personal Information',
                          color: AppColor.primaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.primaryColor,
                      ),
                      GapW(3.w),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GapH(1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Material(
              elevation: 1,
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                splashColor: AppColor.primaryColor.withOpacity(0.10),
                highlightColor: AppColor.transparent,
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.editProfile);
                },
                child: SizedBox(
                  height: 6.h,
                  child: Row(
                    children: [
                      GapW(2.w),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.2.w),
                        child: Image.asset(
                          AppImage.editProfile,
                          height: 3.2.h,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      GapW(2.w),
                      Expanded(
                        child: AppText(
                          'Edit Profile',
                          color: AppColor.primaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.primaryColor,
                      ),
                      GapW(3.w),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GapH(1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Material(
              elevation: 1,
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                splashColor: AppColor.primaryColor.withOpacity(0.10),
                highlightColor: AppColor.transparent,
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.resetPassword);
                },
                child: SizedBox(
                  height: 6.h,
                  child: Row(
                    children: [
                      GapW(2.w),
                      Image.asset(
                        AppImage.resetPassword,
                        height: 4.5.h,
                      ),
                      GapW(2.w),
                      Expanded(
                        child: AppText(
                          'Reset Password',
                          color: AppColor.primaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.primaryColor,
                      ),
                      GapW(3.w),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GapH(1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Material(
              elevation: 1,
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                splashColor: AppColor.primaryColor.withOpacity(0.10),
                highlightColor: AppColor.transparent,
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  authenticationService.logOut();
                },
                child: SizedBox(
                  height: 6.h,
                  child: Row(
                    children: [
                      GapW(2.w),
                      Image.asset(
                        AppImage.logOut,
                        height: 4.5.h,
                        color: AppColor.primaryColor,
                      ),
                      GapW(2.w),
                      Expanded(
                        child: AppText(
                          'Log Out',
                          color: AppColor.primaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.primaryColor,
                      ),
                      GapW(3.w),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
