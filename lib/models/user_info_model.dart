class UserInfoModel {
  int id;
  String first_name;
  String last_name;
  String email;
  String image;
  String phone;
  String password;
  String address;
  String gender;
  String dob;
  String father_name;
  String mother_name;
  int att_percent;
  // int memberSinceDays;

  UserInfoModel({
    this.id = 0,
    this.first_name = "",
    this.last_name = "",
    this.email = "",
    this.image = "",
    this.phone = "",
    this.password = "",
    this.address = "",
    this.gender = "",
    this.dob = "",
    this.father_name = "",
    this.mother_name = "",
    this.att_percent = 0,
    // required this.memberSinceDays
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      email: json['email'],
      image: json['photo'],
      phone: json['phone'],
      password: json['password'] ?? "",
      address: json['address'] ?? "",
      gender: json['gender'] ?? "",
      dob: json['dob'] ?? "",
      father_name: json['father_name'] ?? "",
      mother_name: json['mother_name'] ?? "",
      att_percent: json['att_percent'],
      // memberSinceDays: json['member_since_days'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.first_name;
    data['last_name'] = this.last_name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['father_name'] = this.father_name;
    data['mother_name'] = this.mother_name;
    data['att_percent'] = this.att_percent;
    // data['member_since_days'] = this.memberSinceDays;
    return data;
  }
}
