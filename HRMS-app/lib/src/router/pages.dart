import 'package:get/get.dart';
import 'package:hrms/src/bindings/features/holiday_binding.dart';
import 'package:hrms/src/bindings/features/leave_binding.dart';
import 'package:hrms/src/bindings/features/notice_binding.dart';
import 'package:hrms/src/bindings/features/project_binding.dart';
import 'package:hrms/src/bindings/features/reporting_binding.dart';
import 'package:hrms/src/bindings/home_binding.dart';
import 'package:hrms/src/router/router.dart';
import 'package:hrms/src/screen/add_leave_screen.dart';
import 'package:hrms/src/screen/authentication/edit_profile_screen.dart';
import 'package:hrms/src/screen/authentication/reset_password_screen.dart';
import 'package:hrms/src/screen/authentication/sign_in_screen.dart';
import 'package:hrms/src/screen/features/holiday_screen.dart';
import 'package:hrms/src/screen/features/leaves_screen.dart';
import 'package:hrms/src/screen/features/notice_screen.dart';
import 'package:hrms/src/screen/features/profile_screen.dart';
import 'package:hrms/src/screen/features/project_screen.dart';
import 'package:hrms/src/screen/features/reporting_screen.dart';
import 'package:hrms/src/screen/home/home_screen.dart';
import 'package:hrms/src/screen/on_boarding_screen.dart';
import 'package:hrms/src/screen/splash_screen.dart';
import 'package:hrms/src/screen/user_information_screen.dart';

final List<GetPage> pages = [
  GetPage(
    name: Routes.splash,
    page: () {
      return const SplashScreen();
    },
  ),
  GetPage(
    name: Routes.onBoarding,
    page: () {
      return OnBoardingScreen();
    },
  ),
  GetPage(
    name: Routes.signIn,
    page: () {
      return const SignInScreen();
    },
  ),
  GetPage(
    name: Routes.home,
    binding: HomeBinding(),
    page: () {
      return const HomeScreen();
    },
  ),
  GetPage(
    name: Routes.reporting,
    page: () {
      return const ReportingScreen();
    },
    binding: ReportingBinding(),
  ),
  GetPage(
    name: Routes.leaves,
    page: () {
      return const LeavesScreen();
    },
    binding: LeaveBinding(),
  ),
  GetPage(
    name: Routes.project,
    page: () {
      return const ProjectScreen();
    },
    binding: ProjectBinding(),
  ),
  GetPage(
    name: Routes.profile,
    page: () {
      return const ProfileScreen();
    },
  ),
  GetPage(
    name: Routes.holiday,
    binding: HolidayBinding(),
    page: () {
      return const HolidayScreen();
    },
  ),
  GetPage(
    name: Routes.notice,
    page: () {
      return const NoticeScreen();
    },
    binding: NoticeBinding(),
  ),
  GetPage(
    name: Routes.userInformation,
    page: () {
      return const UserInformationScreen();
    },
  ),
  GetPage(
    name: Routes.resetPassword,
    page: () {
      return const ResetPasswordScreen();
    },
  ),
  GetPage(
    name: Routes.editProfile,
    page: () {
      return const EditProfileScreen();
    },
  ),
  GetPage(
    name: Routes.addLeave,
    page: () {
      return const AddLeaveScreen();
    },
  ),
];
