import 'package:get/get.dart';
import 'package:hrms/src/controller/features/leave_controller.dart';

class LeaveBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LeaveController>(LeaveController());
  }
}
