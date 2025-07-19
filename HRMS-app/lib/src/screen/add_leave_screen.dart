import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/constant/app_image.dart';
import 'package:hrms/src/controller/features/leave_controller.dart';
import 'package:hrms/src/screen/network_screen.dart';
import 'package:hrms/src/utils/date_time_extension.dart';
import 'package:hrms/src/widget/app_elevated_button.dart';
import 'package:hrms/src/widget/app_text.dart';
import 'package:hrms/src/widget/app_text_formfield.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:sizer/sizer.dart';

class AddLeaveScreen extends StatelessWidget {
  const AddLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NetworkScreen(child: AddLeaveScreenView());
  }
}

class AddLeaveScreenView extends StatefulWidget {
  const AddLeaveScreenView({super.key});

  @override
  State<AddLeaveScreenView> createState() => _AddLeaveScreenViewState();
}

class _AddLeaveScreenViewState extends State<AddLeaveScreenView> {
  final leaveController = Get.find<LeaveController>();

  TextEditingController reasonController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void dispose() {
    reasonController.dispose();
    descriptionController.dispose();
    dateController.dispose();
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
          'Add Leave',
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Form(
              key: key,
              child: Column(
                children: [
                  GapH(3.h),
                  Image.asset(
                    AppImage.addLeave,
                    width: 60.w,
                  ),
                  GapH(3.h),
                  AppTextFormField(
                    controller: reasonController,
                    hintText: 'Enter reason',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Leave reason is required';
                      }
                      return null;
                    },
                  ),
                  GapH(2.h),
                  AppTextFormField(
                    controller: descriptionController,
                    minLines: 5,
                    maxLines: 6,
                    hintText: 'Enter description',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Description is required';
                      } else if (value.length < 30) {
                        return 'Enter long description';
                      }
                      return null;
                    },
                  ),
                  GapH(2.h),
                  AppTextFormField(
                    readOnly: true,
                    onTap: () {
                      selectDate();
                    },
                    controller: dateController,
                    hintText: 'Select Date',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Date is required';
                      }
                      return null;
                    },
                    suffixIcon: const Icon(Icons.calendar_month),
                  ),
                  GapH(2.h),
                  AppElevatedButton(
                    text: 'Add Leave',
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        leaveController.addLeave(
                          leaveReason: reasonController.text.trim(),
                          description: descriptionController.text.trim(),
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

  selectDate() async {
    List<DateTime?>? results = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        firstDate: DateTime.now().add(const Duration(days: 2)),
        calendarType: CalendarDatePicker2Type.range,
      ),
      value: leaveController.selectedDate,
      dialogSize: Size(80.w, 400),
      borderRadius: BorderRadius.circular(15),
    );
    if (results == null) return;

    leaveController.selectedDate = results;

    dateController.text =
        '${results[0]!.toShortFormatedDate()} - ${results[1]?.toShortFormatedDate()}';
  }
}
