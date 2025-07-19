import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/controller/features/project_controller.dart';
import 'package:hrms/src/model/project_model.dart';
import 'package:hrms/src/screen/network_screen.dart';
import 'package:hrms/src/widget/app_text.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:sizer/sizer.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NetworkScreen(
      child: ProjectView(),
    );
  }
}

class ProjectView extends StatefulWidget {
  const ProjectView({super.key});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  final projectController = Get.find<ProjectController>();

  @override
  void initState() {
    super.initState();
    projectController.getAllProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
        title: const AppText(
          'Projects',
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
              ProjectModel project = projectController.projects[index];
              return Material(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(3.w),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 3.w,
                    right: 3.w,
                    bottom: 3.w,
                    top: project.status == 'pending' ? 0 : 3.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppText(
                              project.projectTitle!,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: project.status == 'upcoming'
                                    ? AppColor.primaryColor
                                    : project.status == 'running'
                                        ? AppColor.green
                                        : AppColor.red,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: AppText(
                              project.status!,
                              fontSize: 11.sp,
                              color: project.status == 'upcoming'
                                  ? AppColor.primaryColor
                                  : project.status == 'running'
                                      ? AppColor.green
                                      : AppColor.red,
                            ),
                          ),
                        ],
                      ),
                      const GapH(10),
                      AppText(
                        project.description!,
                        textAlign: TextAlign.start,
                        fontSize: 10.5.sp,
                        color: AppColor.primaryColor.withOpacity(0.5),
                      ),
                      GapH(1.h),
                    ],
                  ),
                ),
              );
            },
            itemCount: projectController.projects.length,
            separatorBuilder: (BuildContext context, int index) {
              return GapH(2.h);
            },
          ),
        ),
      ),
    );
  }
}
