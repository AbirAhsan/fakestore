class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });
  late final int id;
  late final String title;
  late final String price;
  late final String category;
  late final String description;
  late final String image;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    category = json['category'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['price'] = price;
    _data['category'] = category;
    _data['description'] = description;
    _data['image'] = image;
    return _data;
  }
}
