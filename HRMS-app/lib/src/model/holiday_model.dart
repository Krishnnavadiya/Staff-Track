class HolidayModel {
  String? sId;
  String? title;
  String? startDate;
  String? endDate;
  String? holidayType;
  String? description;
  String? companyId;
  String? createdAt;
  String? updatedAt;
  String? id;

  HolidayModel({
    this.sId,
    this.title,
    this.startDate,
    this.endDate,
    this.holidayType,
    this.description,
    this.companyId,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  HolidayModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    holidayType = json['holidayType'];
    description = json['description'];
    companyId = json['companyId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['holidayType'] = holidayType;
    data['description'] = description;
    data['companyId'] = companyId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    return data;
  }
}
