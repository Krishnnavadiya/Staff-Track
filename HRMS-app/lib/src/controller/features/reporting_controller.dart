import 'dart:async';

import 'package:get/get.dart';
import 'package:hrms/src/model/response/user_log_response_model.dart';
import 'package:hrms/src/model/user_log_model.dart';
import 'package:hrms/src/repository/feature_repository.dart';

class ReportingController extends GetxController {
  FeatureRepository featureRepository = FeatureRepository();

  RxList<UserLogModel> userLogs = <UserLogModel>[].obs;
  Rx<int> time = 0.obs;
  Rx<bool> isTimeStart = false.obs;

  Future<void> getUserLogData({required int month, required int year}) async {
    UserLogResponseModel result =
        await featureRepository.getUserLogData(month: month, year: year);
    if (result.success) {
      userLogs.clear();
      for (var element in result.data) {
        userLogs.add(element);
      }
    }
  }

}
