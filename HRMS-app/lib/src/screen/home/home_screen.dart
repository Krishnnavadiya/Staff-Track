import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/controller/authentication_service.dart';
import 'package:hrms/src/controller/home_controller.dart';
import 'package:hrms/src/screen/network_screen.dart';
import 'package:hrms/src/widget/app_text.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:hrms/src/widget/home_drawer.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NetworkScreen(child: HomeView());
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final authenticationService = Get.find<AuthenticationService>();
  final homeController = Get.find<HomeController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    authenticationService.profile();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          iconTheme:
              const IconThemeData(color: AppColor.primaryColor, size: 30),
          backgroundColor: AppColor.transparent,
          elevation: 0,
        ),
        drawer: const HomeDrawer(),
        backgroundColor: AppColor.scaffoldBackgroundColor,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return false;
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GapH(10),
                    const AppText(
                      'Welcome to Staff Track,',
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    const GapH(5),
                    AppText(
                      '${authenticationService.user.value.firstName ?? ''} ${authenticationService.user.value.lastName ?? ''}',
                      fontSize: 12.5.sp,
                      color: AppColor.primaryColor,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8.w)),
                  child: Container(
                    color: AppColor.primaryColor,
                    padding: EdgeInsets.only(
                      left: 5.w,
                      right: 5.w,
                    ),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 7.5.w,
                        mainAxisSpacing: 7.5.w,
                      ),
                      padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                      itemCount: homeController.features.length,
                      itemBuilder: (context, index) {
                        final feature = homeController.features[index];
                        return Material(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            splashColor:
                                AppColor.primaryColor.withOpacity(0.10),
                            highlightColor: AppColor.transparent,
                            borderRadius: BorderRadius.circular(20),
                            onTap: feature.onPressed,
                            child: Column(
                              children: [
                                const Spacer(),
                                Image.asset(
                                  feature.image,
                                  height: 20.w,
                                ),
                                const GapH(2),
                                AppText(
                                  feature.title,
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
