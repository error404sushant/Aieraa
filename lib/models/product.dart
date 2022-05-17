class ProductModel {
  late int _totalSize;
  late int _typeId;
  late int _offset;
  late List<Product> _products;

  ProductModel(
      {required int totalSize,
      required int typeId,
      required int offset,
      required List<Product> products}) {
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }

  int get totalSize => _totalSize;
  int get typeId => _typeId;
  int get offset => _offset;
  List<Product> get products => _products;

  ProductModel.fromJson(Map<String, dynamic> json) {
    _totalSize = json['current_page'];
    print('json data');
    print(json['data']);
    // _typeId = json['type_id'] ?? 0;
    // _offset = json['offset'];
    if (json['data'] != null) {
      _products = [];
      json['data'].forEach((v) {
        _products.add(new Product.fromJson(v));
      });
    }
  }
}

class Product {
  int id;
  String title;
  String short_description;
  String description;
  String slug;
  String photo;
  String video;
  String created_at;

  Product(
      {required this.id,
      required this.title,
      required this.short_description,
      required this.description,
      required this.slug,
      required this.photo,
      required this.video,
      required this.created_at});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'].toString(),
      short_description: json['short_description'].toString(),
      description: json['description'],
      slug: json['slug'],
      photo: json['photo'] ?? "event/t98LTAaieraa-overseas-Banner-1.jpeg",
      video: json['video'],
      created_at: json['created_at'].toString(),
    );
  }
  //Convert object to string like
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "short_description": this.short_description,
      "description": this.description,
      "slug": this.slug,
      'photo': this.photo,
      //this part we need for accessing the product model
      //so we will this part later
      'video': this.video,
      'created_at': this.created_at
    };
  }
}
