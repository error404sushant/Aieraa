class ChatModel {
  late List<Chats_u> _chats;

  ChatModel({required List<Chats_u> chats}) {
    this._chats = _chats;
  }
  List<Chats_u> get chats => _chats;

  ChatModel.fromJson(Map<String, dynamic> json) {
    if (json['record'] != null) {
      _chats = [];
      json['record'].forEach((v) {
        _chats.add(Chats_u.fromJson(v));
      });
    }
  }
}

class Chats_u {
  int id;
  String message_id;
  String user_id;
  String message;
  String attachment;
  String created_at;
  String fName;
  String photo;

  Chats_u({
    required this.id,
    required this.message_id,
    required this.user_id,
    required this.message,
    required this.attachment,
    required this.created_at,
    required this.fName,
    required this.photo,
  });

  factory Chats_u.fromJson(Map<String, dynamic> json) {
    return Chats_u(
      id: json['id'],
      message_id: json['message_id'].toString(),
      user_id: json['user_id'].toString(),
      message: json['message'].toString(),
      attachment: json['attachment'].toString(),
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
      "attachment": this.attachment,
      'created_at': this.created_at,
      'fName': this.fName,
      'photo': this.photo,
    };
  }
}
