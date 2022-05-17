class GalleryCategoryModel {
  late List<Category> _categories;

  GalleryCategoryModel({required List<Category> categories}) {
    this._categories = categories;
  }
  List<Category> get categories => _categories;

  GalleryCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['record'] != null) {
      _categories = [];
      json['record'].forEach((vs) {
        _categories.add(new Category.fromJson(vs));
      });
    }
  }
}

class Category {
  int id;
  String name;
  String url_path;
  String updated_at;

  Category({
    required this.id,
    required this.name,
    required this.url_path,
    required this.updated_at,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'].toString(),
      url_path: json['url_path'].toString(),
      updated_at: json['updated_at'].toString(),
    );
  }
  //Convert object to string like
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "url_path": this.url_path,
      "updated_at": this.updated_at,
    };
  }
}
