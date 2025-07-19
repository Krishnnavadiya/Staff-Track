import 'package:get/get.dart';
import 'package:hrms/src/controller/features/notice_controller.dart';

class NoticeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NoticeController>(NoticeController());
  }
}
