import 'package:hrms/src/model/holiday_model.dart';

class HolidayResponseModel {
  int? statusCode;
  bool? success;
  List<HolidayModel>? data;

  HolidayResponseModel({this.statusCode, this.success, this.data});

  HolidayResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    if (json['data'] != null) {
      data = <HolidayModel>[];
      json['data'].forEach((v) {
        data!.add(HolidayModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
