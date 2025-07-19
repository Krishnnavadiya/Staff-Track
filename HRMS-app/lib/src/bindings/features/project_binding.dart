import 'package:get/get.dart';
import 'package:hrms/src/controller/features/project_controller.dart';

class ProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProjectController());
  }
}
