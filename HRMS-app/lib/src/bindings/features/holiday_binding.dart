import 'package:get/get.dart';
import 'package:hrms/src/controller/features/holiday_controller.dart';

class HolidayBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HolidayController>(HolidayController());
  }
}
