import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/controller/authentication_service.dart';
import 'package:hrms/src/screen/network_screen.dart';
import 'package:hrms/src/utils/utils.dart';
import 'package:hrms/src/widget/app_network_image.dart';
import 'package:hrms/src/widget/app_text.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:sizer/sizer.dart';

class UserInformationScreen extends StatelessWidget {
  const UserInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NetworkScreen(child: UserInformationView());
  }
}

class UserInformationView extends StatefulWidget {
  const UserInformationView({super.key});

  @override
  State<UserInformationView> createState() => _UserInformationViewState();
}

class _UserInformationViewState extends State<UserInformationView> {
  final authenticationService = Get.find<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
        title: const AppText(
          'Personal information',
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
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GapH(2.h),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20.w),
                    child: SizedBox(
                      height: 30.w,
                      width: 30.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.w),
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
                  GapH(4.h),
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30)),
                    child: Container(
                      constraints: BoxConstraints(minHeight: 80.h),
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                      ),
                      child: Column(
                        children: [
                          GapH(1.h),
                          if (authenticationService.user.value.firstName !=
                                  null &&
                              authenticationService.user.value.firstName !=
                                  '') ...[
                            GapH(2.h),
                            DataTile(
                              title: 'First Name',
                              value:
                                  authenticationService.user.value.firstName!,
                            ),
                          ],
                          if (authenticationService.user.value.middleName !=
                                  null &&
                              authenticationService.user.value.middleName !=
                                  '') ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Middle Name',
                              value:
                                  authenticationService.user.value.middleName!,
                            ),
                          ],
                          if (authenticationService.user.value.lastName !=
                                  null &&
                              authenticationService.user.value.lastName !=
                                  '') ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Last Name',
                              value: authenticationService.user.value.lastName!,
                            ),
                          ],
                          if (authenticationService.user.value.email != null &&
                              authenticationService.user.value.email != '') ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Email',
                              value: authenticationService.user.value.email!,
                            ),
                          ],
                          if (authenticationService.user.value.mobileNo !=
                                  null &&
                              authenticationService.user.value.mobileNo !=
                                  '') ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Phone Number',
                              value: authenticationService.user.value.mobileNo!,
                            ),
                          ],
                          if (authenticationService.user.value.gender != null &&
                              authenticationService.user.value.gender !=
                                  '') ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Gender',
                              value: authenticationService.user.value.gender!,
                            ),
                          ],
                          if (authenticationService.user.value.doj != null &&
                              authenticationService.user.value.doj != '') ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Join Date',
                              value: authenticationService.user.value.doj!
                                  .toDate()
                                  .toFormatedDate(),
                            ),
                          ],
                          if (authenticationService.user.value.dob != null &&
                              authenticationService.user.value.dob != '') ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Date of Birth',
                              value: authenticationService.user.value.dob!
                                  .toDate()
                                  .toFormatedDate(),
                            ),
                          ],
                          if (authenticationService.user.value.fatherName !=
                                  null &&
                              authenticationService.user.value.fatherName !=
                                  '') ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Father Name',
                              value:
                                  authenticationService.user.value.fatherName!,
                            ),
                          ],
                          if (authenticationService.user.value.motherName !=
                                  null &&
                              authenticationService.user.value.motherName !=
                                  '') ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Mother Name',
                              value:
                                  authenticationService.user.value.motherName!,
                            ),
                          ],
                          if (authenticationService.user.value.department !=
                                  null &&
                              authenticationService
                                      .user.value.department!.name !=
                                  null &&
                              authenticationService
                                      .user.value.department!.name !=
                                  '') ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Departement',
                              value: authenticationService
                                  .user.value.department!.name!,
                            ),
                          ],
                          if (authenticationService.user.value.designation !=
                                  null &&
                              authenticationService
                                      .user.value.designation!.name !=
                                  null &&
                              authenticationService
                                      .user.value.designation!.name !=
                                  '') ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Designation',
                              value: authenticationService
                                  .user.value.designation!.name!,
                            ),
                          ],
                          if (authenticationService.user.value.address !=
                                  null &&
                              authenticationService.user.value.address !=
                                  null) ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Address',
                              value: authenticationService.user.value.address!,
                            ),
                          ],
                          if (authenticationService.user.value.city != null &&
                              authenticationService.user.value.city !=
                                  null) ...[
                            GapH(2.h),
                            DataTile(
                              title: 'City',
                              value: authenticationService.user.value.city!,
                            ),
                          ],
                          if (authenticationService.user.value.state != null &&
                              authenticationService.user.value.state !=
                                  null) ...[
                            GapH(2.h),
                            DataTile(
                              title: 'State',
                              value: authenticationService.user.value.state!,
                            ),
                          ],
                          if (authenticationService.user.value.country !=
                                  null &&
                              authenticationService.user.value.country !=
                                  null) ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Country',
                              value: authenticationService.user.value.country!,
                            ),
                          ],
                          if (authenticationService.user.value.pincode !=
                                  null &&
                              authenticationService.user.value.pincode !=
                                  null) ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Pincode',
                              value: authenticationService.user.value.pincode!,
                            ),
                          ],
                          if (authenticationService
                                      .user.value.adharCardNumber !=
                                  null &&
                              authenticationService
                                      .user.value.adharCardNumber !=
                                  null) ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Adhar Card Number',
                              value: authenticationService
                                  .user.value.adharCardNumber!
                                  .formatCardNumber(),
                            ),
                          ],
                          if (authenticationService
                                      .user.value.emergencyPersonName !=
                                  null &&
                              authenticationService
                                      .user.value.emergencyPersonName !=
                                  null) ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Emergency Person Name',
                              value: authenticationService
                                  .user.value.emergencyPersonName!,
                            ),
                          ],
                          if (authenticationService.user.value
                                      .emergencyPersonContactNumber !=
                                  null &&
                              authenticationService.user.value
                                      .emergencyPersonContactNumber !=
                                  null) ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Emergency Person Number',
                              value: authenticationService
                                  .user.value.emergencyPersonContactNumber!,
                            ),
                          ],
                          if (authenticationService.user.value.bankName !=
                                  null &&
                              authenticationService.user.value.bankName !=
                                  null) ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Bank Name',
                              value: authenticationService.user.value.bankName!,
                            ),
                          ],
                          if (authenticationService.user.value.acHolderName !=
                                  null &&
                              authenticationService.user.value.acHolderName !=
                                  null) ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Account Holder Name',
                              value: authenticationService
                                  .user.value.acHolderName!,
                            ),
                          ],
                          if (authenticationService.user.value.acNumber !=
                                  null &&
                              authenticationService.user.value.acNumber !=
                                  null) ...[
                            GapH(2.h),
                            DataTile(
                              title: 'Account Number',
                              value: authenticationService.user.value.acNumber!,
                            ),
                          ],
                          if (authenticationService.user.value.ifscCode !=
                                  null &&
                              authenticationService.user.value.ifscCode !=
                                  null) ...[
                            GapH(2.h),
                            DataTile(
                              title: 'IFSC Code',
                              value: authenticationService.user.value.ifscCode!,
                            ),
                          ],
                          GapH(3.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DataTile extends StatelessWidget {
  final String title;
  final String value;

  const DataTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AppText(
            title,
            color: AppColor.lightTextColor,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: AppText(
            value,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
