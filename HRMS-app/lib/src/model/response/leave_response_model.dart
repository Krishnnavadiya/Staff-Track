import 'package:hrms/src/model/leave_model.dart';

class LeaveResponseModel {
  int? statusCode;
  bool? success;
  List<LeaveModel>? data;

  LeaveResponseModel({this.statusCode, this.success, this.data});

  LeaveResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    if (json['data'] != null) {
      data = <LeaveModel>[];
      json['data'].forEach((v) {
        data!.add(LeaveModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['success'] = success;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
