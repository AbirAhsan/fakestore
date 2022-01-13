class CartModel {
  static const tblcarts = 'cart';
  static const colId = 'id';
  static const colProductId = 'productId';
  static const colTitle = 'title';
  static const colPrice = 'price';
  static const colCount = 'count';
  static const colImage = 'image';
  CartModel({
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.count,
    required this.image,
  });
  late final int id;
  late final int productId;
  late final String title;
  late final String price;
  late final int count;
  late final String? image;

  CartModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    title = json['title'].toString();
    price = json['price'].toString();
    count = json['count'];
    image = json['image'].toString();
  }

  Map<String, dynamic> toMap() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['productId'] = productId;
    _data['title'] = title;
    _data['price'] = price;
    _data['count'] = count;
    _data['image'] = image;

    return _data;
  }
}
