class SupportModel {
  late List<MsgToken> _msgtoken;
  late List<Chats> _chats;

  SupportModel({required List<MsgToken> msgtoken}) {
    this._msgtoken = _msgtoken;
    this._chats = _chats;
  }
  List<MsgToken> get tokens => _msgtoken;
  List<Chats> get chats => _chats;

  SupportModel.fromJson(Map<String, dynamic> json) {
    if (json['record'] != null) {
      _msgtoken = [];
      json['record'].forEach((v) {
        _msgtoken.add(new MsgToken.fromJson(v));
        if (json['record'] != null) {
          _chats = [];
          v['chats'].forEach((vi) {
            _chats.add(new Chats.fromJson(vi));
          });
        }
      });
    }
  }
}

class MsgToken {
  int id;
  String created_id;
  String subject;
  String category;
  String description;
  String ticket;
  String slug;
  String status;
  String created_at;
  String updated_at;
  String userphoto;

  MsgToken(
      {required this.id,
      required this.created_id,
      required this.subject,
      required this.category,
      required this.description,
      required this.ticket,
      required this.slug,
      required this.status,
      required this.created_at,
      required this.updated_at,
      required this.userphoto});

  factory MsgToken.fromJson(Map<String, dynamic> json) {
    return MsgToken(
      id: json['id'],
      created_id: json['created_at'].toString(),
      subject: json['subject'].toString(),
      category: json['category'].toString(),
      description: json['description'].toString(),
      ticket: json['ticket'],
      slug: json['slug'],
      status: json['status'] ?? "img/food0.png",
      created_at: json['created_at'],
      updated_at: json['updated_at'].toString(),
      userphoto: json['user']['photo'].toString(),
    );
  }
  //Convert object to string like
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "created_id": this.created_id,
      "subject": this.subject,
      "category": this.category,
      "description": this.description,
      "ticket": this.ticket,
      "slug": this.slug,
      'status': this.status,
      //this part we need for accessing the product model
      //so we will this part later
      'created_at': this.created_at,
      'updated_at': this.updated_at,
      'userphoto': this.userphoto
    };
  }
}

class Chats {
  int id;
  String message_id;
  String user_id;
  String message;
  String created_at;
  String fName;
  String photo;

  Chats({
    required this.id,
    required this.message_id,
    required this.user_id,
    required this.message,
    required this.created_at,
    required this.fName,
    required this.photo,
  });

  factory Chats.fromJson(Map<String, dynamic> json) {
    return Chats(
      id: json['id'],
      message_id: json['message_id'].toString(),
      user_id: json['user_id'].toString(),
      message: json['message'].toString(),
      created_at: json['created_at'],
      fName: json['user']['first_name'],
      photo: json['user']['photo'] ??
          'https://picsum.photos/seed/image003/500/300',
    );
  }
  //Convert object to string like
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "message_id": this.message_id,
      "user_id": this.user_id,
      "message": this.message,
      'created_at': this.created_at,
      'fName': this.fName,
      'photo': this.photo,
    };
  }
}
