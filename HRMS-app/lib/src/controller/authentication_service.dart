import 'package:get/get.dart';
import 'package:hrms/src/model/response/common_response_model.dart';
import 'package:hrms/src/model/response/login_data_response_model.dart';
import 'package:hrms/src/model/response/profile_response_model.dart';
import 'package:hrms/src/model/user_model.dart';
import 'package:hrms/src/repository/authentication_repository.dart';
import 'package:hrms/src/router/router.dart';
import 'package:hrms/src/services/image_service.dart';
import 'package:hrms/src/storage/app_storage.dart';
import 'package:hrms/src/utils/app_snackbar.dart';

class AuthenticationService extends GetxService {
  AuthenticationRepository authRepository = AuthenticationRepository();

  Rx<User> user = User().obs;

  void signIn({
    required String email,
    required String password,
  }) async {
    LoginDataResponseModel result =
        await authRepository.signIn(email, password);
    if (!result.success) {
      AppSnackbar.showErrorSnackbar(title: 'Error', message: result.message);
      return;
    }
    await AppStorage.setToken(result.token!);
    await AppStorage.setLogin(true);
    AppSnackbar.showSuccessSnackbar(title: 'Success', message: result.message);
    Get.offAllNamed(Routes.home);
  }

  Future<void> profile() async {
    final ProfileResponseModel result = await authRepository.profile();
    if (result.success) {
      user.value = result.data!;
    }
  }

  Future<void> editProfile({
    required String address,
    required String city,
    required String state,
    required String country,
    required String pincode,
    required String bankName,
    required String acNumber,
  }) async {
    final ProfileResponseModel result = await authRepository.editProfile({
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'pincode': pincode,
      'bankName': bankName,
      'acNumber': acNumber,
    });
    if (result.success) {
      user.value = result.data!;
      Get.back();
      AppSnackbar.showSuccessSnackbar(message: result.message);
    }
  }

  Future<void> profilePicUpdate({required String profilePic}) async {
    final ProfileResponseModel result =
        await authRepository.profilePicUpdate(profilePic: profilePic);
    if (result.success) {
      user.value = result.data!;
    }
  }

  Future<void> selectImage() async {
    String? path = await ImageService.pickImage();
    if (path == null) return;
    profilePicUpdate(profilePic: path);
  }

  Future<void> changePassword({
    required String password,
    required String newPassword,
  }) async {
    CommonResponseModel result = await authRepository.changePassword(
      password: password,
      newPassword: newPassword,
    );
    if (result.success == true) {
      Get.back();
      AppSnackbar.showSuccessSnackbar(message: result.message);
    } else {
      AppSnackbar.showErrorSnackbar(message: result.message);
    }
  }

  Future<void> logOut() async {
    await AppStorage.clearStorage();
    user.value = User();
    Get.offAllNamed(Routes.signIn);
  }
}
