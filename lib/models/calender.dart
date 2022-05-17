class CalenderModel {
  late List<Calender> _calenders;

  CalenderModel({required List<Calender> calenders}) {
    this._calenders = calenders;
  }
  List<Calender> get calenders => _calenders;

  CalenderModel.fromJson(Map<String, dynamic> json) {
    if (json['record'] != null) {
      _calenders = [];
      json['record'].forEach((vs) {
        _calenders.add(new Calender.fromJson(vs));
      });
    }
  }
}

class Calender {
  int id;
  String name;
  String path_url;
  String from_date;
  String to_date;
  String created_at;

  Calender({
    required this.id,
    required this.name,
    required this.path_url,
    required this.from_date,
    required this.to_date,
    required this.created_at,
  });

  factory Calender.fromJson(Map<String, dynamic> json) {
    return Calender(
      id: json['id'],
      name: json['name'].toString(),
      path_url: json['path_url'].toString(),
      from_date: json['from_date'].toString(),
      to_date: json['to_date'].toString(),
      created_at: json['created_at'].toString(),
    );
  }
  //Convert object to string like
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "path_url": this.path_url,
      "from_date": this.from_date,
      "to_date": this.to_date,
      "created_at": this.created_at,
    };
  }
}
