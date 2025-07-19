class CommonResponseModel {
  int? statusCode;
  bool? success;
  String? message;
  
  CommonResponseModel({
    this.statusCode,
    this.success,
    this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'success': success,
      'message': message,
    };
  }

  factory CommonResponseModel.fromMap(Map<String, dynamic> map) {
    return CommonResponseModel(
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      success: map['success'] != null ? map['success'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }
}
