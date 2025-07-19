import 'package:dio/dio.dart';
import 'package:hrms/src/api/api_client.dart';
import 'package:hrms/src/api/api_endpoints.dart';
import 'package:hrms/src/model/response/common_response_model.dart';
import 'package:hrms/src/model/response/login_data_response_model.dart';
import 'package:hrms/src/model/response/profile_response_model.dart';

class AuthenticationRepository {
  ApiClient apiClient = ApiClient();

  Future<LoginDataResponseModel> signIn(
    String email,
    String password,
  ) async {
    dynamic data = await apiClient.post(
      ApiEndpoints.employeeLogin,
      data: {'email': email, 'password': password},
    );
    return LoginDataResponseModel.fromMap(data);
  }

  Future<ProfileResponseModel> profile() async {
    dynamic data = await apiClient.get(
      ApiEndpoints.profile,
    );
    return ProfileResponseModel.fromMap(data);
  }

  Future<ProfileResponseModel> profilePicUpdate({
    required String profilePic,
  }) async {
    final data = FormData.fromMap({
      'profilePic': await MultipartFile.fromFile(profilePic),
    });
    dynamic result = await apiClient.put(
      ApiEndpoints.editProfile,
      data: data,
    );
    return ProfileResponseModel.fromMap(result);
  }

  Future<ProfileResponseModel> editProfile(dynamic data) async {
    dynamic result = await apiClient.put(
      ApiEndpoints.editProfile,
      data: data,
    );
    return ProfileResponseModel.fromMap(result);
  }

  Future<CommonResponseModel> changePassword({
    required String password,
    required String newPassword,
  }) async {
    dynamic result = await apiClient.post(
      ApiEndpoints.changePassword,
      data: {
        'password': password,
        'newPassword': newPassword,
      },
    );
    return CommonResponseModel.fromMap(result);
  }
}
