class CompanyModel {
  String? sId;
  String? logo;
  String? email;
  String? name;
  String? id;

  CompanyModel({this.sId, this.logo, this.email, this.name, this.id});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    logo = json['logo'];
    email = json['email'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['logo'] = logo;
    data['email'] = email;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
