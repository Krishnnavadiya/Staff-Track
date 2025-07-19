class LeaveModel {
  String? sId;
  String? empId;
  String? leaveTitle;
  String? leaveReason;
  String? startDate;
  String? endDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? id;

  LeaveModel({
    this.sId,
    this.empId,
    this.leaveTitle,
    this.leaveReason,
    this.startDate,
    this.endDate,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  LeaveModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    empId = json['empId'];
    leaveTitle = json['leaveTitle'];
    leaveReason = json['leaveReason'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['empId'] = empId;
    data['leaveTitle'] = leaveTitle;
    data['leaveReason'] = leaveReason;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    return data;
  }
}
