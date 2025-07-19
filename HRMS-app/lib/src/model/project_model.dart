class ProjectModel {
  String? sId;
  String? projectTitle;
  String? description;
  String? clientName;
  String? status;
  String? returnDate;
  String? companyId;
  bool? isWorking;
  String? createdAt;
  String? updatedAt;
  String? id;

  ProjectModel({
    this.sId,
    this.projectTitle,
    this.description,
    this.clientName,
    this.status,
    this.returnDate,
    this.companyId,
    this.isWorking,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  ProjectModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    projectTitle = json['projectTitle'];
    description = json['description'];
    clientName = json['clientName'];
    status = json['status'];
    returnDate = json['returnDate'];
    companyId = json['companyId'];
    isWorking = json['isWorking'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['projectTitle'] = projectTitle;
    data['description'] = description;
    data['clientName'] = clientName;
    data['status'] = status;
    data['returnDate'] = returnDate;
    data['companyId'] = companyId;
    data['isWorking'] = isWorking;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    return data;
  }
}
