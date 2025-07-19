import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/controller/features/reporting_controller.dart';
import 'package:hrms/src/screen/network_screen.dart';
import 'package:hrms/src/utils/date_time_extension.dart';
import 'package:hrms/src/utils/string_extension.dart';
import 'package:hrms/src/widget/app_text.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ReportingScreen extends StatelessWidget {
  const ReportingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NetworkScreen(
      child: ReportingView(),
    );
  }
}

class ReportingView extends StatefulWidget {
  const ReportingView({super.key});

  @override
  State<ReportingView> createState() => _ReportingViewState();
}

class _ReportingViewState extends State<ReportingView> {
  final reportingController = Get.find<ReportingController>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    DateTime date = DateTime.now();
    reportingController.getUserLogData(month: date.month, year: date.year);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColor.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.transparent,
          elevation: 0,
          centerTitle: true,
          title: const AppText(
            'Daily Reporting',
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
          child: Column(
            children: [
              GapH(1.h),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    height: 35.h,
                    width: reportingController.userLogs.length * 8.w,
                    constraints:
                        BoxConstraints(minWidth: 100.w - 20, maxWidth: 240.w),
                    child: BarChart(
                      BarChartData(
                        gridData: const FlGridData(
                          drawVerticalLine: false,
                          horizontalInterval: 1,
                        ),
                        borderData: FlBorderData(
                          border: const Border(
                            bottom: BorderSide(),
                            left: BorderSide(),
                          ),
                        ),
                        titlesData: const FlTitlesData(
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        alignment: BarChartAlignment.start,
                        maxY: 12,
                        minY: 0,
                        barGroups: reportingController.userLogs.map((data) {
                          int day =
                              DateFormat('yyyy-MM-dd').parse(data.date!).day;
                          double hour = (data.totalDurationInSeconds! / 3600);
                          return BarChartGroupData(
                            x: day,
                            barsSpace: 1.h,
                            barRods: [
                              BarChartRodData(
                                toY: hour,
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(1),
                                width: 15,
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
              GapH(1.h),
              Expanded(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final log = reportingController.userLogs[index];
                    final String text =
                        log.date!.toDate().toShortFormatedDate(isApi: true);
                    final String time =
                        '${(log.hours ?? 0).toString().padLeft(2, '0')} Hour ${(log.minutes ?? 0).toString().padLeft(2, '0')} Minute';
                    return Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.white,
                      child: Padding(
                        padding: EdgeInsets.all(2.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: AppText(
                                text,
                                fontSize: 12.sp,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w500,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            AppText(
                              time,
                              fontSize: 12.sp,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w500,
                              color: AppColor.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return GapH(1.5.h);
                  },
                  itemCount: reportingController.userLogs.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
