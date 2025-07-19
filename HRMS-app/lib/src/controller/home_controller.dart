import 'package:get/get.dart';
import 'package:hrms/src/constant/app_image.dart';
import 'package:hrms/src/model/feature_model.dart';
import 'package:hrms/src/router/router.dart';

class HomeController extends GetxController {
  RxList<FeatureModel> features = [
    FeatureModel(
      title: 'Daily Reporting',
      image: AppImage.reporting,
      onPressed: () {
        Get.toNamed(Routes.reporting);
      },
    ),
    FeatureModel(
      title: 'Leaves',
      image: AppImage.leave,
      onPressed: () {
        Get.toNamed(Routes.leaves);
      },
    ),
    FeatureModel(
      title: 'Projects',
      image: AppImage.project,
      onPressed: () {
        Get.toNamed(Routes.project);
      },
    ),
    FeatureModel(
      title: 'Profile',
      image: AppImage.profile,
      onPressed: () {
        Get.toNamed(Routes.profile);
      },
    ),
    FeatureModel(
      title: 'Holidays',
      image: AppImage.holiday,
      onPressed: () {
        Get.toNamed(Routes.holiday);
      },
    ),
    FeatureModel(
      title: 'Notice',
      image: AppImage.notice,
      onPressed: () {
        Get.toNamed(Routes.notice);
      },
    ),
  ].obs;
}
