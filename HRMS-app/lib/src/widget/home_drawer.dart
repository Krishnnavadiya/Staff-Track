import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/controller/authentication_service.dart';
import 'package:hrms/src/controller/home_controller.dart';
import 'package:hrms/src/widget/app_network_image.dart';
import 'package:hrms/src/widget/app_text.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:sizer/sizer.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final homeController = Get.find<HomeController>();
  final authenticationService = Get.find<AuthenticationService>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Drawer(
        width: 85.w,
        backgroundColor: AppColor.scaffoldBackgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              Material(
                color: AppColor.white,
                elevation: 1,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: Column(
                    children: [
                      GapH(3.h),
                      Row(
                        children: [
                          GapW(5.w),
                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(20.w),
                            child: InkWell(
                              highlightColor: AppColor.transparent,
                              splashColor: AppColor.transparent,
                              borderRadius: BorderRadius.circular(20.w),
                              onTap: () {
                                Get.back();
                                authenticationService.selectImage();
                              },
                              child: SizedBox(
                                height: 20.w,
                                width: 20.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.w),
                                  child: authenticationService
                                                  .user.value.profilePic !=
                                              null &&
                                          authenticationService
                                                  .user.value.profilePic !=
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
              ),
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return false;
                  },
                  child: ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    itemCount: homeController.features.length,
                    itemBuilder: (context, index) {
                      final feature = homeController.features[index];
                      return Material(
                        elevation: 1,
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          splashColor: AppColor.primaryColor.withOpacity(0.10),
                          highlightColor: AppColor.transparent,
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            Get.back();
                            feature.onPressed();
                          },
                          child: SizedBox(
                            height: 6.h,
                            child: Row(
                              children: [
                                GapW(2.w),
                                Image.asset(
                                  feature.image,
                                  height: 4.5.h,
                                ),
                                GapW(2.w),
                                AppText(
                                  feature.title,
                                  color: AppColor.primaryColor,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return GapH(1.5.h);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
