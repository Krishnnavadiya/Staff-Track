class NoticeModel {
  String? sId;
  String? companyId;
  String? title;
  String? description;
  String? date;
  String? createdAt;
  String? updatedAt;
  String? id;

  NoticeModel({
    this.sId,
    this.companyId,
    this.title,
    this.description,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  NoticeModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    companyId = json['companyId'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['companyId'] = companyId;
    data['title'] = title;
    data['description'] = description;
    data['date'] = date;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    return data;
  }
}
