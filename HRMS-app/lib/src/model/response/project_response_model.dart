import 'package:hrms/src/model/project_model.dart';

class ProjectResponseModel {
  int? statusCode;
  bool? success;
  List<ProjectModel>? data;

  ProjectResponseModel({this.statusCode, this.success, this.data});

  ProjectResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    if (json['data'] != null) {
      data = <ProjectModel>[];
      json['data'].forEach((v) {
        data!.add(ProjectModel.fromJson(v));
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