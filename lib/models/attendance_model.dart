class AttendanceModel {
  String present_class;
  String total_class_days;
  String total_holidays;

  AttendanceModel({
    required this.present_class,
    required this.total_class_days,
    required this.total_holidays,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      present_class: json['present_class'] ?? 0,
      total_class_days: json['total_class_days'] ?? 0,
      total_holidays: json['total_holidays'] ?? 0,
      // orderCount: json['order_count'],
      // memberSinceDays: json['member_since_days'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['present_class'] = present_class;
    data['total_class_days'] = total_class_days;
    data['total_holidays'] = total_holidays;
    return data;
  }
}
