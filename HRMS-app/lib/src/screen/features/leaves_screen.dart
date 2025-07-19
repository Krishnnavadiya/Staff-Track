import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/controller/features/leave_controller.dart';
import 'package:hrms/src/model/leave_model.dart';
import 'package:hrms/src/router/router.dart';
import 'package:hrms/src/screen/network_screen.dart';
import 'package:hrms/src/utils/utils.dart';
import 'package:hrms/src/widget/app_text.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:sizer/sizer.dart';

class LeavesScreen extends StatelessWidget {
  const LeavesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NetworkScreen(
      child: LeavesView(),
    );
  }
}

class LeavesView extends StatefulWidget {
  const LeavesView({super.key});

  @override
  State<LeavesView> createState() => _LeavesViewState();
}

class _LeavesViewState extends State<LeavesView> {
  final leaveController = Get.find<LeaveController>();

  @override
  void initState() {
    leaveController.getAllLeave();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
        title: const AppText(
          'Leaves',
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
              LeaveModel leave = leaveController.leaves[index];
              return Material(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(3.w),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 3.w,
                    right: 3.w,
                    bottom: 3.w,
                    top: leave.status == 'pending' ? 0 : 3.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppText(
                              leave.leaveTitle!,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                            ),
                          ),
                          if (leave.status == 'pending')
                            PopupMenuButton<String>(
                              offset: const Offset(-10, -10),
                              iconColor: AppColor.primaryColor,
                              padding: EdgeInsets.zero,
                              position: PopupMenuPosition.under,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem<String>(
                                    height: 10,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          size: 15.sp,
                                          color: AppColor.red,
                                        ),
                                        GapW(1.w),
                                        AppText(
                                          'Delete',
                                          fontSize: 12.sp,
                                          color: AppColor.red,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      showDeleteDialog(
                                        onDelete: () {
                                          leaveController
                                              .deleteLeave(leave.id!);
                                        },
                                      );
                                    },
                                  ),
                                ];
                              },
                            ),
                        ],
                      ),
                      if (leave.status != 'pending') const GapH(10),
                      AppText(
                        leave.leaveReason!,
                        textAlign: TextAlign.start,
                        fontSize: 10.5.sp,
                        color: AppColor.primaryColor.withOpacity(0.5),
                      ),
                      GapH(1.h),
                      Row(
                        children: [
                          Expanded(
                            child: AppText(
                              '${leave.startDate!.toDate().toShortFormatedDate(isApi: true)} - ${leave.endDate!.toDate().toShortFormatedDate(isApi: true)}',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColor.primaryColor,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.w,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: leave.status == 'approved'
                                    ? AppColor.green
                                    : leave.status == 'rejected'
                                        ? AppColor.red
                                        : AppColor.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: AppText(
                              leave.status!.capitalize!,
                              fontSize: 11.sp,
                              color: leave.status == 'approved'
                                  ? AppColor.green
                                  : leave.status == 'rejected'
                                      ? AppColor.red
                                      : AppColor.blueGrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: leaveController.leaves.length,
            separatorBuilder: (BuildContext context, int index) {
              return GapH(2.h);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.addLeave);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  showDeleteDialog({required void Function() onDelete}) {
    Get.dialog(
      AlertDialog(
        title: const AppText(
          'Are you sure you want to delete leave?',
          textAlign: TextAlign.left,
          fontWeight: FontWeight.w500,
          color: AppColor.primaryColor,
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Get.back();
              onDelete();
            },
            child: AppText(
              'Yes',
              color: AppColor.primaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: AppText(
              'No',
              color: AppColor.primaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
