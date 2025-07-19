import 'package:hrms/src/model/company_model.dart';
import 'package:hrms/src/model/department_model.dart';
import 'package:hrms/src/model/designation_model.dart';

class User {
  String? sId;
  CompanyModel? company;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? profilePic;
  String? publicId;
  String? mobileNo;
  String? gender;
  DepartmentModel? department;
  DesignationModel? designation;
  bool? isWorking;
  String? doj;
  String? dob;
  String? dol;
  String? fatherName;
  String? motherName;
  String? address;
  String? city;
  String? state;
  String? country;
  String? pincode;
  String? adharCardNumber;
  String? emergencyPersonName;
  String? emergencyPersonContactNumber;
  String? bankName;
  String? acHolderName;
  String? acNumber;
  String? ifscCode;
  String? createdAt;
  String? updatedAt;
  String? id;

  User({
    this.sId,
    this.company,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.profilePic,
    this.publicId,
    this.mobileNo,
    this.gender,
    this.department,
    this.designation,
    this.isWorking,
    this.doj,
    this.dob,
    this.dol,
    this.fatherName,
    this.motherName,
    this.address,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.adharCardNumber,
    this.emergencyPersonName,
    this.emergencyPersonContactNumber,
    this.bankName,
    this.acHolderName,
    this.acNumber,
    this.ifscCode,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    company =
        json['company'] != null ? CompanyModel.fromJson(json['company']) : null;
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    email = json['email'];
    profilePic = json['profilePic'];
    publicId = json['publicId'];
    mobileNo = json['mobileNo'];
    gender = json['gender'];
    department = json['department'] != null
        ? DepartmentModel.fromJson(json['department'])
        : null;
    designation = json['designation'] != null
        ? DesignationModel.fromJson(json['designation'])
        : null;
    isWorking = json['isWorking'];
    doj = json['doj'];
    dob = json['dob'];
    dol = json['dol'];
    fatherName = json['fatherName'];
    motherName = json['motherName'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    adharCardNumber = json['adharCardNumber'];
    emergencyPersonName = json['emergencyPersonName'];
    emergencyPersonContactNumber = json['emergencyPersonContactNumber'];
    bankName = json['bankName'];
    acHolderName = json['acHolderName'];
    acNumber = json['acNumber'];
    ifscCode = json['ifscCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['profilePic'] = profilePic;
    data['publicId'] = publicId;
    data['mobileNo'] = mobileNo;
    data['gender'] = gender;
    if (department != null) {
      data['department'] = department!.toJson();
    }
    if (designation != null) {
      data['designation'] = designation!.toJson();
    }
    data['isWorking'] = isWorking;
    data['doj'] = doj;
    data['dob'] = dob;
    data['dol'] = dol;
    data['fatherName'] = fatherName;
    data['motherName'] = motherName;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['pincode'] = pincode;
    data['adharCardNumber'] = adharCardNumber;
    data['emergencyPersonName'] = emergencyPersonName;
    data['emergencyPersonContactNumber'] = emergencyPersonContactNumber;
    data['bankName'] = bankName;
    data['acHolderName'] = acHolderName;
    data['acNumber'] = acNumber;
    data['ifscCode'] = ifscCode;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    return data;
  }
}
