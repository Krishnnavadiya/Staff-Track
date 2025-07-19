import 'package:hrms/src/model/user_log_model.dart';

class UserLogResponseModel {
  int statusCode;
  bool success;
  List<UserLogModel> data;

  UserLogResponseModel({
    required this.statusCode,
    required this.success,
    this.data = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'success': success,
      'data': data.map((x) => x.toJson()).toList(),
    };
  }

  factory UserLogResponseModel.fromMap(Map<String, dynamic> map) {
    return UserLogResponseModel(
      statusCode: map['statusCode'] as int,
      success: map['success'] as bool,
      data: map['data'] != null
          ? List<UserLogModel>.from(
              (map['data'] as List<dynamic>).map<UserLogModel?>(
                (x) => UserLogModel.fromJson(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }
}

