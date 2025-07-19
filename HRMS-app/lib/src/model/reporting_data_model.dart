class ReportingDataModel {
  bool? isTotalTimeRunning;
  int? totalReportingTime;
  int? hours;
  int? minutes;
  int? seconds;

  ReportingDataModel({
    this.isTotalTimeRunning,
    this.totalReportingTime,
    this.hours,
    this.minutes,
    this.seconds,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isTotalTimeRunning': isTotalTimeRunning,
      'totalReportingTime': totalReportingTime,
      'hours': hours,
      'minutes': minutes,
      'seconds': seconds,
    };
  }

  factory ReportingDataModel.fromMap(Map<String, dynamic> map) {
    return ReportingDataModel(
      isTotalTimeRunning: map['isTotalTimeRunning'] != null
          ? map['isTotalTimeRunning'] as bool
          : null,
      totalReportingTime: map['totalReportingTime'] != null
          ? map['totalReportingTime'] as int
          : null,
      hours: map['hours'] != null ? map['hours'] as int : null,
      minutes: map['minutes'] != null ? map['minutes'] as int : null,
      seconds: map['seconds'] != null ? map['seconds'] as int : null,
    );
  }
}
