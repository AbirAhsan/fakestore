class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    this.ratingModel,
  });
  late final int id;
  late final String title;
  late final String price;
  late final String category;
  late final String description;
  late final String? image;
  late final RatingModel? ratingModel;

  ProductModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'].toString();
    price = json['price'].toString();
    category = json['category'].toString();
    description = json['description'].toString();
    image = json['image'].toString();
    ratingModel =
        json['rating'] != null ? RatingModel.fromMap(json['rating']) : null;
  }

  Map<String, dynamic> toMap() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['price'] = price;
    _data['category'] = category;
    _data['description'] = description;
    _data['image'] = image;
    if (ratingModel != null) {
      _data['rating'] = ratingModel!.toMap();
    }
    return _data;
  }
}

class RatingModel {
  RatingModel({
    required this.rate,
    required this.count,
  });
  late final String rate;
  late final String count;

  RatingModel.fromMap(Map<String, dynamic> json) {
    rate = json['rate'].toString();
    count = json['count'].toString();
  }

  Map<String, dynamic> toMap() {
    final _data = <String, dynamic>{};
    _data['rate'] = rate;
    _data['count'] = count;
    return _data;
  }
}
