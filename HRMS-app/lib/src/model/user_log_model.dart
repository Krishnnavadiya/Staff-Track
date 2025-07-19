class UserLogModel {
  String? date;
  int? totalDurationInSeconds;
  int? seconds;
  int? minutes;
  int? hours;

  UserLogModel({
    this.date,
    this.totalDurationInSeconds,
    this.seconds,
    this.minutes,
    this.hours,
  });

  UserLogModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    totalDurationInSeconds = json['totalDurationInSeconds'];
    seconds = json['seconds'];
    minutes = json['minutes'];
    hours = json['hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['totalDurationInSeconds'] = totalDurationInSeconds;
    data['seconds'] = seconds;
    data['minutes'] = minutes;
    data['hours'] = hours;
    return data;
  }
}
