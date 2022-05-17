class GalleryModel {
  late List<Gallery> _galleries;
  // late List<Category> _categories;

  GalleryModel({required List<Gallery> galleries}) {
    this._galleries = galleries;
    // this._categories = categories;
  }

  List<Gallery> get galleries => _galleries;
  // List<Category> get categories => _categories;

  GalleryModel.fromJson(Map<String, dynamic> json) {
    if (json['record'] != null) {
      _galleries = [];
      json['record'].forEach((v) {
        _galleries.add(new Gallery.fromJson(v));
      });
    }
    // if (json['categories'] != null) {
    //   _categories = [];
    //   json['categories'].forEach((vs) {
    //     _categories.add(new Category.fromJson(vs));
    //   });
    // }
  }
}

class Gallery {
  int id;
  String url_path;
  String category_id;
  String created_at;

  Gallery({
    required this.id,
    required this.url_path,
    required this.category_id,
    required this.created_at,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      id: json['id'],
      url_path: json['url_path'].toString(),
      category_id: json['category_id'].toString(),
      created_at: json['created_at'].toString(),
    );
  }
  //Convert object to string like
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "url_path": url_path,
      'category_id': category_id,
      'created_at': created_at,
    };
  }
}

// class Category {
//   int id;
//   String name;
//
//   Category({
//     required this.id,
//     required this.name,
//   });
//
//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       id: json['id'],
//       name: json['name'].toString(),
//     );
//   }
//   //Convert object to string like
//   Map<String, dynamic> toJson() {
//     return {
//       "id": this.id,
//       "name": this.name,
//     };
//   }
// }
