import 'package:fakestore/database/cart_database.dart';
import 'package:fakestore/model/cart_model.dart';
import 'package:fakestore/model/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartModel _cartModel = CartModel();
  late CartDatabaseHelper _dbHelper;

  RxList<CartModel?> cartListFromLocal =
      List<CartModel?>.empty(growable: true).obs;

  @override
  onInit() async {
    _dbHelper = CartDatabaseHelper.instance;
    await fetchCartList();
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
    fetchCartList();
  }

  fetchCartList() {
    try {
      _dbHelper.fetchCart().then((resp) {
        cartListFromLocal.value = resp;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
