class CourseModel {
  late List<Courses> _courses;
  late List<Subjects> _subjects;

  CourseModel({required List<Courses> courses}) {
    this._courses = _courses;
    this._subjects = _subjects;
  }
  List<Courses> get courses => _courses;
  List<Subjects> get subjects => _subjects;

  CourseModel.fromJson(Map<String, dynamic> json) {
    if (json['record'] != null) {
      _courses = [];
      json['record'].forEach((v) {
        _courses.add(new Courses.fromJson(v));
      });
    }
    if (json['subjects'] != null) {
      _subjects = [];
      json['subjects'].forEach((vs) {
        _subjects.add(new Subjects.fromJson(vs));
      });
    }
  }
}

class Courses {
  int id;
  String name;
  int batch_id;
  String batch_name;
  int subject_id;
  String subject_name;
  String url_path;
  String description;
  String thumbnail;
  String created_at;
  String updated_at;

  Courses({
    required this.id,
    required this.name,
    required this.batch_id,
    required this.batch_name,
    required this.subject_id,
    required this.subject_name,
    required this.url_path,
    required this.description,
    required this.thumbnail,
    required this.created_at,
    required this.updated_at,
  });

  factory Courses.fromJson(Map<String, dynamic> json) {
    return Courses(
      id: json['id'],
      name: json['name'].toString(),
      batch_id: json['batch_id'],
      batch_name: json['batch']['name'].toString(),
      subject_id: json['subject_id'],
      subject_name: json['subject']['name'].toString(),
      url_path: json['url_path'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
  //Convert object to string like
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "batch_id": this.batch_id,
      "batch_name": this.batch_name,
      "subject_id": this.subject_id,
      "subject_name": this.subject_name,
      "url_path": this.url_path,
      "description": this.description,
      "thumbnail": this.thumbnail,
      'created_at': this.created_at,
      'updated_at': this.updated_at,
    };
  }
}

class Subjects {
  int id;
  String name;
  int batch_id;

  Subjects({
    required this.id,
    required this.name,
    required this.batch_id,
  });

  factory Subjects.fromJson(Map<String, dynamic> json) {
    return Subjects(
      id: json['id'],
      name: json['name'].toString(),
      batch_id: json['bath_id'] ?? 1,
    );
  }
  //Convert object to string like
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "bath_id": this.batch_id,
    };
  }
}
