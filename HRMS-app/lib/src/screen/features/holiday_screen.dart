import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/controller/features/holiday_controller.dart';
import 'package:hrms/src/model/holiday_model.dart';
import 'package:hrms/src/screen/network_screen.dart';
import 'package:hrms/src/utils/date_time_extension.dart';
import 'package:hrms/src/utils/string_extension.dart';
import 'package:hrms/src/widget/app_text.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:sizer/sizer.dart';

class HolidayScreen extends StatelessWidget {
  const HolidayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NetworkScreen(
      child: HolidayView(),
    );
  }
}

class HolidayView extends StatefulWidget {
  const HolidayView({super.key});

  @override
  State<HolidayView> createState() => _HolidayViewState();
}

class _HolidayViewState extends State<HolidayView> {
  final holidayController = Get.find<HolidayController>();

  @override
  void initState() {
    holidayController.getAllHolidays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 245, 241, 241),
        elevation: 0,
        title: const AppText(
          'Holidays',
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
              HolidayModel holiday = holidayController.holidays[index];
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
                        holiday.holidayType!,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                      const GapH(10),
                      AppText(
                        holiday.description!,
                        textAlign: TextAlign.start,
                        fontSize: 10.5.sp,
                        color: AppColor.primaryColor.withOpacity(0.5),
                      ),
                      GapH(1.h),
                      Row(
                        children: [
                          Expanded(
                            child: AppText(
                              '${holiday.startDate!.toDate().toShortFormatedDate(isApi: true)} - ${holiday.endDate!.toDate().toShortFormatedDate(isApi: true)}',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColor.primaryColor,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: holidayController.holidays.length,
            separatorBuilder: (BuildContext context, int index) {
              return GapH(2.h);
            },
          ),
        ),
      ),
    );
  }
}
