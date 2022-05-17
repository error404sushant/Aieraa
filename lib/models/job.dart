class JobModel {
  late List<Job> _jobs;

  JobModel({required List<Job> jobs}) {
    this._jobs = jobs;
  }

  List<Job> get jobs => _jobs;

  JobModel.fromJson(Map<String, dynamic> json) {
    print('json data');
    print(json['record']);
    if (json['record'] != null) {
      _jobs = [];
      json['record'].forEach((v) {
        _jobs.add(new Job.fromJson(v));
      });
    }
  }
}

class Job {
  int id;
  String title;
  String description;
  String salary;
  String from_date;
  String to_date;
  String created_at;
  String updated_at;

  Job(
      {required this.id,
      required this.title,
      required this.description,
      required this.salary,
      required this.from_date,
      required this.to_date,
      required this.created_at,
      required this.updated_at});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'].toString(),
      description: json['description'].toString(),
      salary: json['salary'].toString(),
      from_date: json['from_date'],
      to_date: json['to_date'] ?? "event/t98LTAaieraa-overseas-Banner-1.jpeg",
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
  //Convert object to string like
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "salary": salary,
      "from_date": from_date,
      'to_date': to_date,
      'created_at': created_at,
      'updated_at': updated_at
    };
  }
}
