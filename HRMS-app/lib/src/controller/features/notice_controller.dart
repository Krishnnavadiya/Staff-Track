import 'package:get/get.dart';
import 'package:hrms/src/model/notice_model.dart';
import 'package:hrms/src/model/response/notice_response_model.dart';
import 'package:hrms/src/repository/feature_repository.dart';

class NoticeController extends GetxController {
  FeatureRepository featureRepository = FeatureRepository();
  RxList<NoticeModel> notices = <NoticeModel>[].obs;

  Future<void> getAllNotice() async {
    NoticeResponseModel result = await featureRepository.getAllNotice();
    if (result.success == true) {
      notices.value = result.data ?? [];
    }
  }
}
