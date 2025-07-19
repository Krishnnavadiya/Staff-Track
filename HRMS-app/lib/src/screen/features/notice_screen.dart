import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/controller/features/notice_controller.dart';
import 'package:hrms/src/model/notice_model.dart';
import 'package:hrms/src/screen/network_screen.dart';
import 'package:hrms/src/utils/date_time_extension.dart';
import 'package:hrms/src/utils/string_extension.dart';
import 'package:hrms/src/widget/app_text.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:sizer/sizer.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NetworkScreen(
      child: NoticeView(),
    );
  }
}

class NoticeView extends StatefulWidget {
  const NoticeView({super.key});

  @override
  State<NoticeView> createState() => _NoticeViewState();
}

class _NoticeViewState extends State<NoticeView> {
  final noticeController = Get.find<NoticeController>();

  @override
  void initState() {
    super.initState();
    noticeController.getAllNotice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
        title: const AppText(
          'Notice',
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
        child: Obx(
          () => ListView.separated(
            padding:
                EdgeInsets.only(left: 5.w, right: 5.w, bottom: 3.h, top: 1.h),
            itemBuilder: (context, index) {
              NoticeModel notice = noticeController.notices[index];
              return Material(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(3.w),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        notice.title!,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                      GapH(1.h),
                      AppText(
                        notice.description!,
                        textAlign: TextAlign.start,
                        fontSize: 10.5.sp,
                        color: AppColor.primaryColor.withOpacity(0.5),
                      ),
                      GapH(1.h),
                      AppText(
                        notice.date!.toDate().toShortFormatedDate(isApi: true),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryColor,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: noticeController.notices.length,
            separatorBuilder: (BuildContext context, int index) {
              return GapH(2.h);
            },
          ),
        ),
      ),
    );
  }
}
