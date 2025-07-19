import 'package:get/get.dart';
import 'package:hrms/src/controller/features/reporting_controller.dart';

class ReportingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ReportingController>(ReportingController());
  }
}
