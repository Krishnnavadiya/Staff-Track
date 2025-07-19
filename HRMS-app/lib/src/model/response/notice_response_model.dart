import 'package:hrms/src/model/notice_model.dart';

class NoticeResponseModel {
  int? statusCode;
  bool? success;
  List<NoticeModel>? data;

  NoticeResponseModel({this.statusCode, this.success, this.data});

  NoticeResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    if (json['data'] != null) {
      data = <NoticeModel>[];
      json['data'].forEach((v) {
        data!.add(NoticeModel.fromJson(v));
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
