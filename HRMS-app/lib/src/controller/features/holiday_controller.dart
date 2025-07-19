import 'package:get/get.dart';
import 'package:hrms/src/model/holiday_model.dart';
import 'package:hrms/src/model/response/holiday_response_model.dart';
import 'package:hrms/src/repository/feature_repository.dart';

class HolidayController extends GetxController {
  FeatureRepository featureRepository = FeatureRepository();
  RxList<HolidayModel> holidays = <HolidayModel>[].obs;

  Future<void> getAllHolidays() async {
    HolidayResponseModel result = await featureRepository.getAllHoliday();
    if (result.success == true) {
      holidays.value = result.data!;
      holidays.value = holidays.reversed.toList();
    }
  }
}
