import 'package:get/get.dart';
import 'package:hrms/src/controller/authentication_service.dart';
import 'package:hrms/src/controller/network_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationService());
    Get.put(NetworkService());
  }
}
