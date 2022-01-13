import 'package:fakestore/database/cart_database.dart';
import 'package:fakestore/model/cart_model.dart';
import 'package:fakestore/model/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartModel _cartModel = CartModel();
  late CartDatabaseHelper _dbHelper;

  @override
  onInit() async {
    _dbHelper = CartDatabaseHelper.instance;
    super.onInit();
  }

//<<==================  Product Add to Cart
  addToCart(ProductModel productModel, int count) {
    _cartModel.productId = productModel.id;
    _cartModel.title = productModel.title;
    _cartModel.price = productModel.price;
    _cartModel.count = count;
    _cartModel.image = productModel.image;

    _dbHelper.insert(_cartModel);
  }
}
