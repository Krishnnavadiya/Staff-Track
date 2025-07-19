class DesignationModel {
  String? sId;
  String? name;
  String? companyId;
  String? createdAt;
  String? updatedAt;
  String? id;

  DesignationModel({
    this.sId,
    this.name,
    this.companyId,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  DesignationModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    companyId = json['companyId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['companyId'] = companyId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    return data;
  }
}
