import 'package:get/get.dart';
import 'package:hrms/src/model/leave_model.dart';
import 'package:hrms/src/model/response/common_response_model.dart';
import 'package:hrms/src/model/response/leave_response_model.dart';
import 'package:hrms/src/repository/feature_repository.dart';
import 'package:hrms/src/utils/app_snackbar.dart';
import 'package:hrms/src/utils/date_time_extension.dart';

class LeaveController extends GetxController {
  FeatureRepository featureRepository = FeatureRepository();
  RxList<LeaveModel> leaves = <LeaveModel>[].obs;
  List<DateTime?> selectedDate = [];

  Future<void> getAllLeave() async {
    LeaveResponseModel result = await featureRepository.getAllLeave();
    if (result.success == true) {
      leaves.value = result.data!;
      leaves.value = leaves.reversed.toList();
    }
  }

  Future<void> deleteLeave(String id) async {
    CommonResponseModel result = await featureRepository.deleteLeave(id);
    if (result.success == true) {
      AppSnackbar.showSuccessSnackbar(message: result.message);
      getAllLeave();
    } else {
      AppSnackbar.showErrorSnackbar(message: result.message);
    }
  }

  Future<void> addLeave({
    required String leaveReason,
    required String description,
  }) async {
    CommonResponseModel result = await featureRepository.addLeave(
      leaveReason: leaveReason,
      description: description,
      startDate: selectedDate[0]!.toApiCallFormate(),
      endDate: selectedDate[1]!.toApiCallFormate(),
    );
    if (result.success == true) {
      Get.back();
      AppSnackbar.showSuccessSnackbar(message: result.message);
      getAllLeave();
    } else {
      AppSnackbar.showErrorSnackbar(message: result.message);
    }
  }
}
