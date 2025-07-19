import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:hrms/src/constant/app_image.dart';
import 'package:hrms/src/controller/authentication_service.dart';
import 'package:hrms/src/screen/network_screen.dart';
import 'package:hrms/src/widget/app_elevated_button.dart';
import 'package:hrms/src/widget/app_network_image.dart';
import 'package:hrms/src/widget/app_text.dart';
import 'package:hrms/src/widget/app_text_formfield.dart';
import 'package:hrms/src/widget/gap.dart';
import 'package:sizer/sizer.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NetworkScreen(child: EditProfileView());
  }
}

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final authenticationService = Get.find<AuthenticationService>();

  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addressController.text = authenticationService.user.value.address ?? '';
    cityController.text = authenticationService.user.value.city ?? '';
    stateController.text = authenticationService.user.value.state ?? '';
    countryController.text = authenticationService.user.value.country ?? '';
    pincodeController.text = authenticationService.user.value.pincode ?? '';
    bankNameController.text = authenticationService.user.value.bankName ?? '';
    accountNumberController.text =
        authenticationService.user.value.acNumber ?? '';
  }

  @override
  void dispose() {
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    pincodeController.dispose();
    bankNameController.dispose();
    accountNumberController.dispose();
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
          'Edit Profile',
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  GapH(2.h),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20.w),
                    child: InkWell(
                      highlightColor: AppColor.transparent,
                      splashColor: AppColor.transparent,
                      borderRadius: BorderRadius.circular(20.w),
                      onTap: () {
                        authenticationService.selectImage();
                      },
                      child: Obx(
                        () => SizedBox(
                          height: 35.w,
                          width: 35.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.w),
                            child:
                                authenticationService.user.value.profilePic !=
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
                  ),
                  GapH(3.h),
                  AppTextFormField(
                    controller: addressController,
                    hintText: 'Enter address',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        AppImage.address,
                        height: 5,
                      ),
                    ),
                  ),
                  GapH(2.h),
                  AppTextFormField(
                    controller: cityController,
                    hintText: 'Enter city',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        AppImage.city,
                        height: 5,
                      ),
                    ),
                  ),
                  GapH(2.h),
                  AppTextFormField(
                    controller: stateController,
                    hintText: 'Enter state',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        AppImage.city,
                        height: 5,
                      ),
                    ),
                  ),
                  GapH(2.h),
                  AppTextFormField(
                    controller: countryController,
                    hintText: 'Enter country',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        AppImage.country,
                        height: 5,
                      ),
                    ),
                  ),
                  GapH(2.h),
                  AppTextFormField(
                    controller: pincodeController,
                    hintText: 'Enter pincode',
                    keyboardType: TextInputType.number,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        AppImage.pincode,
                        height: 5,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                  GapH(2.h),
                  AppTextFormField(
                    controller: bankNameController,
                    hintText: 'Enter bank name',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        AppImage.bankName,
                        height: 5,
                      ),
                    ),
                  ),
                  GapH(2.h),
                  AppTextFormField(
                    controller: accountNumberController,
                    hintText: 'Enter account number',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        AppImage.accountNumber,
                        height: 5,
                      ),
                    ),
                  ),
                  GapH(2.h),
                  AppElevatedButton(
                    text: 'Save',
                    onPressed: () {
                      authenticationService.editProfile(
                        address: addressController.text.trim(),
                        city: cityController.text.trim(),
                        state: stateController.text.trim(),
                        country: countryController.text.trim(),
                        pincode: pincodeController.text.trim(),
                        bankName: bankNameController.text.trim(),
                        acNumber: accountNumberController.text.trim(),
                      );
                    },
                  ),
                  GapH(5.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
